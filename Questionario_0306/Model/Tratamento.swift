//
//  Tratamento.swift
//  Questionario_0306
//
//  Created by Diego Carvalho on 03/06/22.
//

import Foundation

struct Tratamento {
    
    let quiz = [Questionario(p: "A gestação dos cavalos-marinhos é feita pelos machos.", r: "Verdadeiro"),
                Questionario(p: "Por causa do tamanho, as girafas ficam o tempo todo em pé e só se deitam quando vão dar à luz.", r: "Falso"),
                Questionario(p: "Os ornitorrincos são os únicos mamíferos venenosos que se tem notícia.", r: "Falso"),
                Questionario(p: "Os louva-a-deus são capazes de capturar aranhas, lagartos e até ratos.", r: "Verdadeiro"),
                Questionario(p: "Apesar de serem os mais famosos, os morcegos não são os únicos mamíferos capazes de voar.", r: "Falso"),
                Questionario(p: "Existe uma espécie de pássaro que fica voando por até dez meses sem parar.", r: "Verdadeiro"),
                Questionario(p: "Algumas arraias conseguem dar saltos de até três metros de altura.", r: "Verdadeiro"),
                Questionario(p: "Os beija-flores são excelentes voadores, mas também conseguem usar suas patas para caminhar no solo.", r: "Falso"),
                Questionario(p: "Um bicho-preguiça possui mais vértebras cervicais que um elefante ou uma girafa.", r: "Verdadeiro"),
                Questionario(p: "Os golfinhos usam as toxinas liberadas pelos baiacus para ficarem doidões.", r: "Verdadeiro")
    ]
    
    var numeroQuestao = 0
    var pontuacao = 0
    
    func obtemPergunta() -> String{
        return quiz[numeroQuestao].pergunta
    }
    
    mutating func checkResposta (respostaUsuario: String) -> Bool{
        if respostaUsuario == quiz[numeroQuestao].resposta{
            pontuacao += 1
            return true
        }
        return false
    }
    
    mutating func proxQuestao() {
        if numeroQuestao + 1 < quiz.count{
            numeroQuestao += 1
        }else{
            numeroQuestao = 0
            pontuacao = 0
        }
    }
    
    func atualizaplacar() -> Int {
        return pontuacao
    }
    
    func marcaProgresso() -> Float{
        return Float(numeroQuestao + 1) / Float(quiz.count)
        
    }
    
}

