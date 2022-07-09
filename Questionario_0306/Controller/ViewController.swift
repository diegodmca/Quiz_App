//
//  ViewController.swift
//  Questionario_0306
//
//  Created by Diego Carvalho on 03/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var retornoResposta: UILabel!
    @IBOutlet weak var textoQuestao: UILabel!
    @IBOutlet weak var verdadeiro: UIButton!
    @IBOutlet weak var falso: UIButton!
    @IBOutlet weak var barraProgresso: UIProgressView!
    @IBOutlet weak var pontuacao: UILabel!
    
    var tratamento = Tratamento()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barraProgresso.progress = 0
        atualizaUI()
    }
    
    @IBAction func botaoPressionado(_ sender: UIButton) {
        let respostaUsuario = sender.currentTitle!
        let resposta = tratamento.checkResposta(respostaUsuario: respostaUsuario)
        
        if resposta{
            sender.backgroundColor = UIColor.green
            retornoResposta.text = "Resposta correta!"
        }else{
            sender.backgroundColor = UIColor.red
            retornoResposta.text = "Resposta errada!"
        }
        tratamento.proxQuestao()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(atualizaUI), userInfo: nil, repeats: false)
    }
    
   @objc func atualizaUI (){
        textoQuestao.text = tratamento.obtemPergunta()
        pontuacao.text = String("Pontuação: \(tratamento.atualizaplacar())")
       verdadeiro.backgroundColor = UIColor.clear
       falso.backgroundColor = UIColor.clear
       retornoResposta.text = "   "
       barraProgresso.progress = tratamento.marcaProgresso()
    }
}

