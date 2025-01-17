#ifndef HYACHANDLER_H
#define HYACHANDLER_H

#include <QObject>

class HYACHandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int targetTemperature READ targetTemperature WRITE setTargetTemperature NOTIFY targetTemperatureChanged FINAL)
public:
    explicit HYACHandler(QObject *parent = nullptr);

    int targetTemperature() const;

    Q_INVOKABLE void incrementTargetTemperature(const int & val);

public slots:
    void setTargetTemperature(int newTargetTemperature);

signals:

    void targetTemperatureChanged();

private:

    int m_targetTemperature;
};

#endif // HYACHANDLER_H
