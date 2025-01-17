#include "system.h"
#include <QDateTime>
#include <QDebug>

System::System(QObject *parent)
    : QObject{parent},
    m_carLocked(true),
    m_outdoorTemp(64),
    m_userName("jjeongni"),
    m_currentTime("12:30am")
{
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(500);
    m_currentTimeTimer->setSingleShot(true);
    connect(m_currentTimeTimer, &QTimer::timeout, this, &System::currentTimeTimerTimeout);

    currentTimeTimerTimeout();
}

bool System::carLocked() const
{
    return m_carLocked;
}

void System::setCarLocked(bool newCarLocked)
{
    if (m_carLocked == newCarLocked)
        return;
    m_carLocked = newCarLocked;
    emit carLockedChanged();
}

int System::outdoorTemp() const
{
    return m_outdoorTemp;
}

void System::setOutdoorTemp(int newOutdoorTemp)
{
    if (m_outdoorTemp == newOutdoorTemp)
        return;
    m_outdoorTemp = newOutdoorTemp;
    emit outdoorTempChanged();
}

QString System::userName() const
{
    return m_userName;
}

void System::setUserName(const QString &newUserName)
{
    if (m_userName == newUserName)
        return;
    m_userName = newUserName;
    emit userNameChanged();
}

QString System::currentTime() const
{
    return m_currentTime;
}

void System::setCurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void System::currentTimeTimerTimeout()
{
    QDateTime dateTime;
    QString currentTime = dateTime.currentDateTime().toString("h:m ap");
    // qDebug() << currentTime;

    setCurrentTime( currentTime );

    m_currentTimeTimer->start();
}

QString System::outdoorTempCelsius() const
{
    // double celsius = (m_outdoorTemp - 32) * 5.0 / 9.0;
    // return QString::number(celsius, 'f', 1); // 소수점 한 자리까지 표현

    double temperature = m_useCelsius
                             ? (m_outdoorTemp - 32) * 5.0 / 9.0 // 화씨 -> 섭씨
                             : m_outdoorTemp; // 화씨 그대로 사용

    return QString::number(temperature, 'f', 1); // 소수점 한 자리까지 출력
}

bool System::useCelsius() const
{
    return m_useCelsius;
}

void System::setUseCelsius(bool newUseCelsius)
{
    if (m_useCelsius == newUseCelsius)
        return;
    m_useCelsius = newUseCelsius;
    emit useCelsiusChanged();
}
