#ifndef TEST2_CUSTOMGRAPHICSITEM_H
#define TEST2_CUSTOMGRAPHICSITEM_H

// Qt
#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPolygonF>
#include <QVariantList>

namespace test2
{

class CustomGraphicsItem : public QQuickPaintedItem
{

public:


    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName)
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(QColor fillColor READ fillColor WRITE setFillColor NOTIFY fillColorChanged)
    Q_PROPERTY(qreal lineWidth READ lineWidth WRITE setLineWidth NOTIFY lineWidthChanged)

    Q_PROPERTY(QVariantList points READ points WRITE setPoints NOTIFY pointsChanged)

    Q_ENUMS(GraphicsType)
    Q_PROPERTY(GraphicsType graphicsType READ graphicsType WRITE setGraphicsType NOTIFY graphicsTypeChanged)

public:
    enum GraphicsType {POLYGON, POLYLINE, POINTS};

    explicit CustomGraphicsItem(QQuickItem *parent = 0);

    QString name() const
    { return _name; }
    void setName(const QString &name)
    { _name = name; }

    QColor color() const
    { return _color; }
    void setColor(const QColor &color)
    {
        if (_color != color)
        {
            _color = color;
            emit colorChanged();
        }
    }

    QColor fillColor() const
    { return _fillColor; }

    void setFillColor(const QColor &color)
    {
        if (_fillColor != color)
        {
            _fillColor = color;
            emit fillColorChanged();
        }
    }


    QVariantList points() const;
    void setPoints(const QVariantList &points);

    qreal lineWidth() const
    { return _lineWidth; }

    void setLineWidth(qreal lineWidth)
    {
        if (_lineWidth != lineWidth)
        {
            _lineWidth = lineWidth;
            emit lineWidthChanged();
        }
    }

    GraphicsType graphicsType() const
    { return _graphicsType; }

    void setGraphicsType(GraphicsType type);

    virtual void paint(QPainter *painter);

public slots:
    void appendPoint(const QPointF &point);
    void clear();

signals:
    void pointsChanged();
    void lineWidthChanged();
    void colorChanged();
    void graphicsTypeChanged();
    void fillColorChanged();

protected:

    // declare dispatching function pointer:
    void (CustomGraphicsItem::*PaintFunction)(QPainter *);

    void paintPolygon(QPainter *);
    void paintPolyline(QPainter *);
    void paintPoints(QPainter *);

    void setupItemSize();

    QString _name;
    QColor _color;
    QColor _fillColor;
    qreal _lineWidth;

    QPolygonF _points;

    GraphicsType _graphicsType;




};

}

#endif // TEST2_CUSTOMGRAPHICSITEM_H

