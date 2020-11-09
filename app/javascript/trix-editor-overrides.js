window.addEventListener("trix-file-accept", function(event) {  
  const acceptedTypes = ['image/jpeg', 'image/png', 'image/jpg', 'application/pdf']  
  if (!acceptedTypes.includes(event.file.type)) {    
    event.preventDefault()    
    alert("Only jpeg, jpg, png or pdf files can be uploaded")  
  }});