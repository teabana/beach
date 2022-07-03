document.addEventListener("DOMContentLoaded", () => {
  const searchInput = document.querySelector(".search_input");
  if (searchInput){
    const inputElement = document.getElementById("keyword");
    inputElement.addEventListener("input", () => {
      const keywordSearch = document.getElementById("keyword").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/beachs/search/?keyword=${keywordSearch}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search_result");
        searchResult.innerHTML = "";
        if (XHR.response){
          const searchName = XHR.response.keyword;
          searchName.forEach((beach) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", beach.id);
            childElement.innerHTML = beach.name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(beach.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("keyword").value = clickElement.textContent;
              clickElement.remove();
            })
          });
        };
      };
    });
  };
});