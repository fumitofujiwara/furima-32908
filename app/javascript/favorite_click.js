const favorite = () => {
  const icon = document.getElementById('favorite-icon');
  icon.addEventListener('click', () =>{
    console.log("click");
  });
};
window.addEventListener('load', favorite);