#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ carLocked WRITE setCarLocked NOTIFY carLockedChanged)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged FINAL)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged)
    Q_PROPERTY(QString outdoorTempCelsius READ outdoorTempCelsius NOTIFY outdoorTempChanged)
    Q_PROPERTY(bool useCelsius READ useCelsius WRITE setUseCelsius NOTIFY useCelsiusChanged)

public:
    explicit System(QObject *parent = nullptr);

    bool carLocked() const;
    Q_INVOKABLE void setCarLocked(bool newCarLocked); // QML에서 호출 가능하도록 Q_INVOKABLE 추가

    int outdoorTemp() const;
    Q_INVOKABLE void setOutdoorTemp(int newOutdoorTemp);

    QString userName() const;
    Q_INVOKABLE void setUserName(const QString &newUserName);

    QString currentTime() const;
    Q_INVOKABLE void setCurrentTime(const QString &newCurrentTime);

    void currentTimeTimerTimeout();

    QString outdoorTempCelsius() const;

    bool useCelsius() const;

    Q_INVOKABLE void setUseCelsius(bool newUseCelsius);

signals:
    void carLockedChanged();
    void outdoorTempChanged();

    void userNameChanged();

    void currentTimeChanged();

    void useCelsiusChanged();

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_userName;
    QString m_currentTime;
    QTimer * m_currentTimeTimer;
    QString m_outdoorTempCelsius;
    bool m_useCelsius = true;
};

#endif // SYSTEM_H
