package com.ufab.biblioteca_ufab.controllers;

import java.util.Optional;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ufab.biblioteca_ufab.excecoes.ItemInvalidoException;
import com.ufab.biblioteca_ufab.models.entidades.TrabalhoDeConclusao;
import com.ufab.biblioteca_ufab.models.enums.TipoDeItemDoAcervo;
import com.ufab.biblioteca_ufab.models.enums.TipoDeTrabalhoDeConclusao;
import com.ufab.biblioteca_ufab.models.repositorios.TrabalhoDeConclusaoRepositorio;

/**
 * Classe responsável por manipular as informações dos objetos tipo
 * TrabalhoDeConclusao.
 * 
 * @author Luis Lancellote
 * @author Rauny Henrique
 */

@Controller
@RequestMapping("/trabalhos")
public class TrabalhoDeConclusaoController {

	static final Logger logger = LoggerFactory.getLogger(TrabalhoDeConclusaoController.class);

	@Autowired private TrabalhoDeConclusaoRepositorio trabalhoDeConclusaoRepositorio;

	/**
	 * Atribui um título, url e uma lista de trabalhos de conclusão e tipos de trabalho cadastrados no banco ao modelo que será
	 * redirecionado à view de trabalhos de conclusão
	 * 
	 * @param model
	 * @return "trabalho/listar"
	 * @author Luis Lancellote
	 * @author Rauny Henrique
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String listar(Model model) {
				
		Iterable<TrabalhoDeConclusao> trabalhos = trabalhoDeConclusaoRepositorio.findAll();
		
		model.addAttribute("titulo", "Listagem de trabalhos de conclusão");
		model.addAttribute("url", "trabalhos");
		
		model.addAttribute("tipos",TipoDeTrabalhoDeConclusao.values());
		model.addAttribute("trabalhos", trabalhos);
		
		logger.info("Itens listados com sucesso.");			
		return "trabalho/listar";
	}
	
	/**
	 * Persiste um objeto do tipo TrabalhoDeConclusao recebido como parâmetro
	 * 
	 * @param trabalho, bindingResult, model
	 * @return "trabalho/table-listar"
	 * @author Luis Lancellote
	 * @author Rauny Henrique
	 */
	@RequestMapping(method = RequestMethod.POST)
	public String salvar(@Valid @ModelAttribute TrabalhoDeConclusao trabalho, BindingResult bindingResult, Model model) {

		if (bindingResult.hasErrors()) {
			
			System.out.println(bindingResult.getFieldErrors());
			
			logger.info("Erro ao salvar item.");
			throw new ItemInvalidoException();

		} else {
			
			trabalho.setItem_tipo(TipoDeItemDoAcervo.TRABALHOSDECONCLUSAO);
			
			trabalhoDeConclusaoRepositorio.save(trabalho);
			logger.info("Item salvo com sucesso.");
		}

		Iterable<TrabalhoDeConclusao> trabalhos = trabalhoDeConclusaoRepositorio.findAll();
		
		model.addAttribute("trabalhos", trabalhos);
		
		return "trabalho/table-listar";

	}	

	/**
	 * Realiza uma busca na tabela de trabalhos de conclusão com base no id recebido como parâmetro
	 * e retorna um objeto que possua o id buscado
	 * 
	 * @param id
	 * @return trabalho
	 * @author Luis Lancellote
	 * @author Rauny Henrique
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/{id}")
	@ResponseBody//retorna JSON
	public TrabalhoDeConclusao buscarById(@PathVariable Long id) {
		
		Optional<TrabalhoDeConclusao> trabalho = trabalhoDeConclusaoRepositorio.findById(id);

		return trabalho.get();

	}

	/**
	 * Exclui do banco, um objeto do tipo TrabalhoDeConclusao que possua o id recebido como parâmetro
	 * 
	 * @param id
	 * @return ResponseEntity
	 * @author Luis Lancellote
	 * @author Rauny Henrique
	 */
	@RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
	public ResponseEntity<String> deletar(@PathVariable Long id) {
				
		try {
			trabalhoDeConclusaoRepositorio.deleteById(id);
			logger.info("Item deletado com sucesso.");

			return new ResponseEntity<String>(HttpStatus.OK);
			
		} catch (Exception e) {
			
			logger.info("Erro ao deletar item.");
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			
		}	

	}

	
}
