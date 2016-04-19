#ifndef TEST2_CUTTERTRACKER_H
#define TEST2_CUTTERTRACKER_H

// Qt
#include <QObject>
#include <QList>
#include <QPointF>


namespace test2
{

class CutterTracker : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isTracked READ isTracked WRITE setIsTracked NOTIFY isTrackedChanged)

public:
    explicit CutterTracker(QObject *parent = 0);

    QList<QPointF> points() const
    { return _points; }
    void setPoints(const QList<QPointF> & points)
    { _points = points; }



    bool isTracked() const
    { return _isTracked; }

    void setIsTracked(bool isTracked)
    {
        if (_isTracked != isTracked)
        {
            _isTracked = isTracked;
            emit isTrackedChanged();
        }
    }

public slots:

    void appendPoint(const QPointF & point);

    int nbOfPoints() const
    { return _points.size(); }

    QPointF getPoint(int i)
    { return ( i >= 0 && i < _points.size() ) ? _points[i] : QPointF(); }

    void clear()
    { _points.clear(); }

signals:
    void isTrackedChanged();

protected:

    QList<QPointF> _points;
    bool _isTracked;

};

}

#endif // CUTTERTRACKER_H
