#include "hyachandler.h"

HYACHandler::HYACHandler(QObject *parent)
    : QObject{parent}
    , m_targetTemperature(70)
{}

int HYACHandler::targetTemperature() const
{
    return m_targetTemperature;
}

void HYACHandler::incrementTargetTemperature(const int &val)
{
    int newTargetTemp = m_targetTemperature + val;
    setTargetTemperature(newTargetTemp);

}

void HYACHandler::setTargetTemperature(int newTargetTemperature)
{
    if (m_targetTemperature == newTargetTemperature)
        return;
    m_targetTemperature = newTargetTemperature;
    emit targetTemperatureChanged();
}
