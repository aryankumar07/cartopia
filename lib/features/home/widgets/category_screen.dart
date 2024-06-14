import 'package:cartopia/features/home/widgets/categories_card.dart';
import 'package:cartopia/features/home/widgets/category_display.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  final List<String> categories = [
    'Impressionism', 
    'Pop art',
    'Cubism',
    'Surrealism',
    'Contemporary art',
    'Art Nouveau',
    'Futurism',
    'Romanticism',
    'Art Deco',
    'Baroque',
    'Graffiti',
    'Minimalism',
    'BAUHAUS',
    'Conceptual art',
    'Harlem Renaissance',
    'Constructivism',
    'Contemporary',
    'Dada'
  ];

  final Map<String,String> categories_images = {
    'Impressionism' : 'https://images.unsplash.com/photo-1579783928621-7a13d66a62d1?q=80&w=3090&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 
    'Pop art' : 'https://images.unsplash.com/photo-1637703335900-4b9f4ac8a606?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'Cubism' : 'https://plus.unsplash.com/premium_photo-1711987692262-0d3aca86fc1d?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'Surrealism' : 'https://plus.unsplash.com/premium_photo-1682308389619-5e3d0a14c066?q=80&w=3067&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'Contemporary art' : 'https://images.unsplash.com/photo-1529772187639-085af5eb1c40?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'Art Nouveau' : 'https://images.unsplash.com/photo-1577083165633-14ebcdb0f658?q=80&w=2483&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'Futurism' : 'https://images.unsplash.com/photo-1615307250409-be3bc317121c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' ,
    'Romanticism' : 'https://images.unsplash.com/photo-1612279644161-57ce62801d3a?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'Art Deco' : 'https://images.unsplash.com/photo-1612487528505-d2338264c821?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'Baroque' : 'https://images.unsplash.com/photo-1603525689518-1d8c608e5cbe?q=80&w=3088&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'Graffiti' : 'https://images.unsplash.com/photo-1487452066049-a710f7296400?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'Minimalism' : 'https://plus.unsplash.com/premium_photo-1669068927842-1fa33acbe63e?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'BAUHAUS' : 'https://images.unsplash.com/photo-1582555482682-8312c538e115?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'Conceptual art' : 'https://images.unsplash.com/photo-1615650949849-37db4f2c67db?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29uY2VwdHVhbCUyMGFydHxlbnwwfHwwfHx8MA%3D%3D',
    'Harlem Renaissance' : 'https://images.unsplash.com/photo-1556819309-4d0df7941a1f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8SGFybGVtJTIwUmVuYWlzc2FuY2V8ZW58MHx8MHx8fDA%3D',
    'Constructivism ': 'https://images.unsplash.com/photo-1622376050668-31da9d303986?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'Contemporary' : 'https://images.unsplash.com/photo-1602464729960-f95937746b68?q=80&w=2268&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'Dada': 'https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?q=80&w=3145&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  };

  void navigateToCategory(String category){
    Navigator.pushNamed(context, CategoryDisplay.routeName,arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
      child: Column(
        children: [


          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: ()=>navigateToCategory(categories[index]),
                  child: Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(categories_images[categories[index]]!),
                        ),
                        Text(
                          categories[index],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.brown
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
          ),

          Container(
            height: 1,
            decoration: BoxDecoration(color: Colors.grey),
          ),
          SizedBox(height: 20,),

          CategoryCard(
            imageUrl: categories_images['Impressionism']!, 
            category: 'Impressionism',
            desciption: 'Impressionism developed in France in the nineteenth century and is based on the practice of painting out of doors and spontaneously \'on the spot\' rather than in a studio from sketches. Main impressionist subjects were landscapes and scenes of everyday life', 
            pos: true),
          SizedBox(height: 10,),

          CategoryCard(
            imageUrl: categories_images['Pop art']!, 
            category: 'Pop art',
            desciption: 'An abbreviation of Popular Art, Pop art is characterized by a deconstruction of images seen in popular culture – television, comic books, magazines, movies and other various forms of advertising.', 
            pos: false),
          SizedBox(height: 10,),

          CategoryCard(
            imageUrl: categories_images['Cubism']!, 
            category: 'Cubism',
            desciption: 'Cubism is an early-20th-century avant-garde art movement begun in Paris that revolutionized painting and the visual arts, and influenced artistic innovations in music, ballet, literature, and architecture', 
            pos: true),
          SizedBox(height: 10,),

          CategoryCard(
            imageUrl: categories_images['Surrealism']!, 
            category: 'Surrealism',
            desciption: 'It is a style that tries to challenge reality by depicting a warped, irrational universe filled with surprising, bizarre features.', 
            pos: false),
          SizedBox(height: 10,),

          CategoryCard(
            imageUrl: categories_images['Graffiti']!, 
            category: 'Graffiti',
            desciption: 'Graffiti is a stylized form of artistic expression that consists of using spray paint or other materials to reclaim public space by writing or drawing on public walls, buildings, or other outdoor surfaces.', 
            pos: true),
          SizedBox(height: 10,),

          CategoryCard(
            imageUrl: categories_images['Minimalism']!, 
            category: 'Minimalism',
            desciption: 'Minimalism is a style in art, design, and theatre that utilizes the smallest range of materials and colors possible, and only very simple shapes or forms', 
            pos: false),
          SizedBox(height: 10,),

          CategoryCard(
            imageUrl: categories_images['Romanticism']!, 
            category: 'Romanticism',
            desciption: 'In Romantic art, nature—with its uncontrollable power, unpredictability, and potential for cataclysmic extremes—offered an alternative to the ordered world of Enlightenment thought', 
            pos: true),
          SizedBox(height: 10,),

        ],
      ),
    );
  }
}