
// Qt
#include <QPen>
#include <QPainter>

// Project
#include "CustomGraphicsItem.h"

namespace test2
{

/// Constructor
CustomGraphicsItem::CustomGraphicsItem(QQuickItem *parent) :
    QQuickPaintedItem(parent),
    _lineWidth(0.0),
    _graphicsType(POINTS)
{
    PaintFunction = &CustomGraphicsItem::paintPoints;
}

/// Method to setup item size : width and height
void CustomGraphicsItem::setupItemSize()
{
    setSize(QSize(_points.boundingRect().bottomRight().x(),
              _points.boundingRect().bottomRight().y())*1.2);
}

/// Method to set points
void CustomGraphicsItem::setPoints(const QVariantList &points)
{
    foreach (QVariant p, points)
    {
        _points.append(p.toPointF());
    }

    // setup width and height
    setupItemSize();

    emit pointsChanged();
    update();
}

/// Method to get points
QVariantList CustomGraphicsItem::points() const
{
    QVariantList output;
    foreach (QPointF p, _points)
    {
        output.append(QVariant(p));
    }
    return output;
}

/// Method to append a point
void CustomGraphicsItem::appendPoint(const QPointF & point)
{
    _points.append(point);

    // setup width and height
    setupItemSize();

    emit pointsChanged();
    update();
}

/// Method to set graphics type
void CustomGraphicsItem::setGraphicsType(GraphicsType type)
{
    if (_graphicsType != type)
    {
        _graphicsType = type;

        if (_graphicsType == POLYGON)
        {
            PaintFunction = &CustomGraphicsItem::paintPolygon;
        }
        else if (_graphicsType == POLYLINE)
        {
            PaintFunction = &CustomGraphicsItem::paintPolyline;
        }
        else if (_graphicsType == POINTS)
        {
            PaintFunction = &CustomGraphicsItem::paintPoints;
        }
        emit graphicsTypeChanged();
        update();
    }
}

/// Method to clear all points
void CustomGraphicsItem::clear()
{
    _points.clear();
    emit pointsChanged();
    update();
}


/// Overload paint() method
void CustomGraphicsItem::paint(QPainter *painter)
{

    QPen pen(_color, _lineWidth);
    QBrush brush(_fillColor);

    painter->setPen(pen);
    painter->setBrush(brush);
    painter->setRenderHints(QPainter::Antialiasing, true);

    if (!_points.isEmpty())
        (*this.*PaintFunction)(painter);

}

/// Method to draw a polygon
void CustomGraphicsItem::paintPolygon(QPainter *painter)
{
    painter->drawPolygon(_points);
}

/// Method to draw a polyline
void CustomGraphicsItem::paintPolyline(QPainter *painter)
{
    painter->drawPolyline(_points);
}

/// Method to draw points
void CustomGraphicsItem::paintPoints(QPainter *painter)
{
    painter->drawPoints(_points);
}


}


