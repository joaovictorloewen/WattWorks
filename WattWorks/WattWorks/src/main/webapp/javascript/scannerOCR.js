document.getElementById('uploadScan').addEventListener('change', async (event) => {
  const file = event.target.files[0]
  if (!file) return

  const previewImage = document.getElementById('previewImage')
  const loading = document.getElementById('loading')

  previewImage.src = URL.createObjectURL(file)
  previewImage.classList.remove("d-none")

  loading.classList.remove('d-none')

  try {
    const { data: { text } } = await Tesseract.recognize(file, 'por', {
      logger: m => console.log(m)
    }); 

    preencherCamposComOCR(text);
  } catch (error) {
    console.error('Erro na leitura OCR:', error)
    alert('Erro ao ler a imagem. Tente novamente.')
  } finally {
    loading.classList.add('d-none')
  }
});


function preencherCamposComOCR(texto) {
  console.log('Texto OCR:', texto);

  const grupoMatch = texto.match(/GRUPO\s+([A-Z0-9]+)/i);
  console.log('Match:', grupoMatch);

  if (grupoMatch && grupoMatch[1]) {
    const grupoValue = grupoMatch[1].trim();
    console.log('Grupo detectado:', grupoValue);

    document.getElementById('subgrupoId').value = grupoValue;

  } else {
    console.warn('Grupo não encontrado no texto OCR.');
  }
}
