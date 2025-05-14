import QtQuick
import QtQuick.Particles

Rectangle {
    id: root
    color: "transparent"

    property bool isDeDirection: false


    ParticleSystem{
        id: particleSystem
    }


    Emitter{
        id: emitter
        anchors.fill: parent

        system: particleSystem
        emitRate: 2000
        lifeSpan: 2500
        lifeSpanVariation: 500
        size: 0.1

        velocity: AngleDirection{
            angle: root.isDeDirection ? 105 : 75
            angleVariation: 15
            magnitude: 100
            magnitudeVariation: 50
        }
    }

    ImageParticle {
        source: "pic/ChuShuang.png"
        system: particleSystem
    }

    function startParticle(){
        particleSystem.restart()
    }

    function stopParticle(){
        particleSystem.stop()

    }
}
