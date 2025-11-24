function exibirDiv(id) {
    const divAExibir = document.getElementById(id)
    divAExibir.style.display = (divAExibir.style.display === 'none') ? 'flex' : 'none'
}

async function carregamentoDinamico() {
    try { 
        const navbarResponse = await fetch('/WattWorks/carregamentoDinamico/navbar.jsp')
		const footerResponse = await fetch('/WattWorks/carregamentoDinamico/footer.jsp')


        if (!navbarResponse.ok || !footerResponse.ok) {
            throw new Error('Erro ao carregar um ou mais arquivos HTML')
		}
		
        const navbarHtml = await navbarResponse.text()	
		const footerHtml = await footerResponse.text()	
		
        document.body.insertAdjacentHTML('afterbegin', navbarHtml)	
		document.body.insertAdjacentHTML('beforeend', footerHtml)	
    } catch (error) {
        console.error('Falha ao carregar componentes da página:', error)
        const errorMessage = `<div style="color:red;text-align:center;margin:20px;">Erro ao carregar partes da página. Tente novamente mais tarde.</div>`
        document.body.insertAdjacentHTML('beforeend', errorMessage)
    }
}

carregamentoDinamico()