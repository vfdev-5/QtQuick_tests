
// Qt
#include <QPen>
#include <QPainter>

// Project
#include "Polygon.h"

namespace test2
{

/// Constructor
Polygon::Polygon(QQuickItem *parent) :
    QQuickPaintedItem(parent),
    _lineWidth(0.0)
{
}

/// Method to set points
void Polygon::setPoints(const QVariantList &points)
{
    foreach (QVariant p, points)
    {
        _points.append(p.toPointF());
    }

    // setup width and height
    setSize(QSize(_points.boundingRect().bottomRight().x(),
                  _points.boundingRect().bottomRight().y())*1.2);
}

/// Method to get points
QVariantList Polygon::points() const
{
    QVariantList output;
    foreach (QPointF p, _points)
    {
        output.append(QVariant(p));
    }
    return output;
}


/// Overload paint() method
void Polygon::paint(QPainter *painter)
{

    QPen pen(_color, _lineWidth);
    QBrush brush(_fillColor);

    painter->setPen(pen);
    painter->setBrush(brush);
    painter->setRenderHints(QPainter::Antialiasing, true);

//    painter->drawPie(boundingRect().adjusted(1, 1, -1, -1), 90 * 16, 290 * 16);
    if (!_points.isEmpty())
        painter->drawPolygon(_points);

}

}
