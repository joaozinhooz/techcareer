import 'package:flutter/material.dart';

class CourseDetailsPage extends StatelessWidget {
  final int courseIndex;

  CourseDetailsPage({required this.courseIndex});

  // Lista de dados com informações de cada curso
  final List<Map<String, String>> coursesData = [
    {
      'title': 'Técnico em Administração',
      'description': 'O curso de Técnico em Administração forma profissionais aptos a executar atividades administrativas em diversas áreas de uma organização. Os estudantes aprendem sobre gestão de pessoas, finanças, marketing, logística, contabilidade e processos organizacionais. A formação inclui tanto aspectos teóricos quanto práticos, preparando os alunos para atuarem em escritórios, empresas, instituições públicas e privadas.',
      'details': 'Este curso frequentemente inclui disciplinas de empreendedorismo, capacitando os alunos a iniciarem e gerenciarem seus próprios negócios.',
    },
    {
      'title': 'Técnico em Informática',
      'description': 'O curso de Técnico em Informática capacita profissionais para atuarem com programação, manutenção de computadores, redes de computadores e desenvolvimento de sistemas. Os alunos estudam linguagens de programação, banco de dados, sistemas operacionais e segurança da informação. A formação prática em laboratórios é uma parte essencial do curso, permitindo aos alunos aplicarem os conhecimentos em situações reais.',
      'details': 'Os alunos geralmente têm a oportunidade de obter certificações profissionais reconhecidas no mercado, como a Certificação CompTIA A+ e Cisco CCNA.',
    },
    {
      'title': 'Técnico em Logística',
      'description': 'O curso de Técnico em Logística ensina sobre a gestão da cadeia de suprimentos, transporte, armazenamento e distribuição de mercadorias. Os estudantes aprendem a otimizar processos logísticos, melhorar a eficiência do fluxo de materiais e gerenciar estoques. O curso é ideal para quem deseja trabalhar em armazéns, transportadoras, centros de distribuição e empresas de logística.',
      'details': 'O curso enfatiza o uso de sistemas de gerenciamento de armazéns (WMS) e ERP (Enterprise Resource Planning), ferramentas essenciais para a gestão eficiente de estoques e processos logísticos.',
    },
    {
      'title': 'Técnico em Eletrônica',
      'description': 'O curso de Técnico em Eletrônica prepara profissionais para a manutenção e desenvolvimento de sistemas eletrônicos. Os alunos estudam eletrônica digital e analógica, circuitos eletrônicos, automação e controle, além de aprenderem sobre a montagem e manutenção de equipamentos eletrônicos. Este curso é indicado para quem deseja trabalhar em indústrias, empresas de manutenção e tecnologia.',
      'details': 'O curso frequentemente inclui treinamentos práticos com software de simulação eletrônica, como o Multisim, que permite a criação e teste de circuitos antes da implementação física.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Obter os detalhes do curso com base no índice
    String courseTitle = coursesData[courseIndex]['title']!;
    String courseDescription = coursesData[courseIndex]['description']!;
    String courseDetails = coursesData[courseIndex]['details']!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Curso'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      courseTitle,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Descrição:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          courseDescription,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Detalhes:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          courseDetails,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CourseDetailsPage(courseIndex: 0), // Exemplo com o primeiro curso
  ));
}
