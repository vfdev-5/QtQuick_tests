
// Project
#include "CutterTracker.h"

namespace test2
{

/// Constructor
CutterTracker::CutterTracker(QObject *parent) :
    QObject(parent),
    _isTracked(false)
{
}

/// Invokable method to append a point
void CutterTracker::appendPoint(const QPointF & point)
{
    _points.append(point);
}

}
