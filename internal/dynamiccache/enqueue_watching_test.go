package dynamiccache

import (
	"context"
	"testing"

	"github.com/stretchr/testify/mock"
	"github.com/stretchr/testify/require"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/apimachinery/pkg/runtime/schema"
	"k8s.io/apimachinery/pkg/types"
	"sigs.k8s.io/controller-runtime/pkg/event"
	"sigs.k8s.io/controller-runtime/pkg/reconcile"

	"package-operator.run/internal/testutil"
)

func TestEnqueueWatchingObjects(t *testing.T) {
	t.Parallel()

	ownerRefGetter := &ownerRefGetterMock{}
	q := &testutil.TypedRateLimitingQueue[reconcile.Request]{}
	scheme := runtime.NewScheme()
	require.NoError(t, corev1.AddToScheme(scheme))

	ownerRefGetter.
		On("OwnersForGKV", schema.GroupVersionKind{
			Version: "v1",
			Kind:    "Secret",
		}).
		Return([]OwnerReference{
			{
				GroupKind: schema.GroupKind{
					Kind: "ConfigMap",
				},
				Name:      "cmtest",
				Namespace: "cmtestns",
			},
		})

	q.On("Add", reconcile.Request{
		NamespacedName: types.NamespacedName{
			Name:      "cmtest",
			Namespace: "cmtestns",
		},
	})

	h := NewEnqueueWatchingObjects(ownerRefGetter, &corev1.ConfigMap{}, scheme)
	h.Create(context.Background(), event.CreateEvent{
		Object: &corev1.Secret{
			ObjectMeta: metav1.ObjectMeta{
				Name:      "test",
				Namespace: "testns",
			},
		},
	}, q)

	q.AssertExpectations(t)
	ownerRefGetter.AssertExpectations(t)
}

type ownerRefGetterMock struct {
	mock.Mock
}

func (m *ownerRefGetterMock) OwnersForGKV(gvk schema.GroupVersionKind) []OwnerReference {
	args := m.Called(gvk)
	return args.Get(0).([]OwnerReference)
}
