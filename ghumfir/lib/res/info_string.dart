const String biratInfo =
    """Birat Darbar in Biratnagar is a historical landmark associated with the ancient King
Birat, after whom the city is named. The site is believed to have been the palace of
King Birat, a figure from the Mahabharata epic. Though the exact age and
historical details of the palace are subjects of local lore, the Birat Darbar holds
cultural significance for the region. The structure reflects the architectural style of
the period and is a symbol of the city&#39;s rich heritage. Over the years, Birat Darbar
has attracted both pilgrims and tourists interested in exploring Nepal’s historical
roots. The site stands as a testament to Biratnagar connection to ancient history,
blending mythological importance with local pride. Restoration efforts and tourism
development projects are ongoing to preserve this significant cultural landmark.""";

List<String> imageLink = [
  "https://imgs.search.brave.com/kfdWwei2yYuKsX398Zns-dBoZ5P4IhNbUFWy60gAI5U/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Z29kaWdpdC5jb20v/Y29udGVudC9kYW0v/Z29kaWdpdC9kaXJl/Y3Rwb3J0YWwvZW4v/Y29udGVudGhtL3Rv/cC1wbGFjZXMtdG8t/dmlzaXQtaW4tbmVw/YWwuanBn",
  "https://imgs.search.brave.com/Jra7KDXLcmBQ7zOHE2Ds7tl4zOemSTqowQKJZ68reso/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS53b3JsZG5vbWFk/cy5jb20vRXhwbG9y/ZS9uZXBhbC81LXRo/aW5ncy1uZXBhbC5q/cGc",
  "https://imgs.search.brave.com/yR-HAPLOQ_yVItHs4NI-Ll93xsZX446PMdtevuP5qdE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS53b3JsZG5vbWFk/cy5jb20vRXhwbG9y/ZS9uZXBhbC9yb2Fk/LXNhZmV0eS1uZXBh/bC1iaWJlay1uZXVw/YW5lLmpwZw",
  "https://imgs.search.brave.com/KcBBp3peN9JJDPcOKaBiaQN8BkuiDRYjUlhXgyrWn24/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/dG91cnJhZGFyLmNv/bS9zMy90b3VyLzE1/MDB4ODAwLzIxNzg0/MF82MDllYjI1MGYy/MjEwLmpwZw",
  "https://imgs.search.brave.com/FFZH-UamqTeEu6dOHy7Bn5QWrH5Yz2C5uDm-GdwGBxU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9scC1j/bXMtcHJvZHVjdGlv/bi5pbWdpeC5uZXQv/MjAyMi0wMS9HZXR0/eVJGXzUxMDI3NjAz/MS5qcGc_Zml0PWNy/b3Amdz0zNjAmYXI9/MToxJmF1dG89Zm9y/bWF0JnE9NzU",
  "https://imgs.search.brave.com/VY-tUu6JDIWJ6779GVqqfLIjx-aNEnzgzcvexTHMeT4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vbGg2Lmdv/b2dsZXVzZXJjb250/ZW50LmNvbS8tZjJT/d2NvenVGaUkvU1M4/US1iNFJFeEkvQUFB/QUFBQUFMOW8vSC1B/cGR0OUFNWGMvczYz/Mi93cmtya2lkc185/OTc1LmpwZz96b29t/PTImcmVzaXplPTQ0/MiwzNDQmc3NsPTE",
  "https://imgs.search.brave.com/Y95dkx_-EByCkYY5OxhwEZ1Prc23qCG0Fx18pjhLgVs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jLm15/aG9saWRheXMuY29t/L2Jsb2cvYmxvZy9j/b250ZW50L2ltYWdl/cy8yMDIwLzEwL1Ro/YW1lbC53ZWJw",
  "https://imgs.search.brave.com/ywn5QRYtl-CeE7KR4TmXBWfjV27XpHx3OWb0I3oNpE0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dHdvd2FuZGVyaW5n/c29sZXMuY29tL3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDIxLzA3/L2ltZ182MGVlN2Rk/MDI5N2M1LmpwZw",
  "https://imgs.search.brave.com/C4i-WwRWRK9QTprCZyUFtotvoM08oxvyF6HMcAQvCHU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dG91cm15aW5kaWEu/Y29tL2Jsb2cvL3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA0/L0FubmFwdXJuYS10/cmVrLmpwZw",
  "https://www.fiscalnepal.com/wp-content/uploads/2021/09/tourist.jpg",
  "https://english.onlinekhabar.com/wp-content/uploads/2023/02/trekking-in-Nepal-4-1024x768.jpg",
  "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2018/others/p1-anchor-copy_1534642979.jpg&w=900&height=601",
  "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2020/news/thumb-(1)%20(6).jpg&w=900&height=601",
  "https://abovethehimalaya.com/wp-content/uploads/2019/08/nepal-visa.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTun8mbgkL4Qs6sHcPBD4CH6f6WbEngWyF2Kw&s"
];
