#ifndef TEST2_POLYGON_H
#define TEST2_POLYGON_H


// Qt
#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPolygonF>

namespace test2
{

class Polygon : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName)
    Q_PROPERTY(QColor color READ color WRITE setColor)
    Q_PROPERTY(QColor fillColor READ fillColor WRITE setFillColor)
    Q_PROPERTY(qreal lineWidth READ lineWidth WRITE setLineWidth)

    Q_PROPERTY(QVariantList points READ points WRITE setPoints)

public:
    explicit Polygon(QQuickItem *parent = 0);

    QString name() const
    { return _name; }
    void setName(const QString &name)
    { _name = name; }

    QColor color() const
    { return _color; }
    void setColor(const QColor &color)
    { _color = color; }

    QColor fillColor() const
    { return _fillColor; }
    void setFillColor(const QColor &color)
    { _fillColor = color; }

    QVariantList points() const;
    void setPoints(const QVariantList &points);

    qreal lineWidth() const
    { return _lineWidth; }

    void setLineWidth(qreal lineWidth)
    { _lineWidth = lineWidth; }

    virtual void paint(QPainter *painter);

private:
    QString _name;
    QColor _color;
    QColor _fillColor;
    qreal _lineWidth;

    QPolygonF _points;

};

}

#endif // TEST2_POLYGON_H
