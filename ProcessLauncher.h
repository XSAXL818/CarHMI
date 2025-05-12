// ProcessLauncher.h
#include <QObject>
#include <QProcess>

class ProcessLauncher : public QObject {
    Q_OBJECT
public:
    Q_INVOKABLE void startExe(const QString &path) {
        QProcess::startDetached(path); // 直接启动，不处理错误
    }
};
