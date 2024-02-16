import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_desafio/app/services/comprar_service.dart';
import '../routes/app_routes.dart';
import '../widgets/icon_button.dart';
import '../widgets/drawer/custom_drawer.dart';

class ComprarPage extends StatefulWidget {
  const ComprarPage({Key? key}) : super(key: key);

  @override
  State<ComprarPage> createState() => _ComprarPageState();
}

class _ComprarPageState extends State<ComprarPage> {
  var iconButtons = IconButtons();

  final _formKey = GlobalKey<FormState>();
  final _pageController = PageController();

  late List<Map<String, dynamic>> formas = [];

  String? selectedForma;
  double? tamanhoHorizontal;
  double? tamanhoVertical;
  double valorFinal = 0.0;

  void goTo(route) {
    setState(() {
      Navigator.of(context).pushReplacementNamed(route);
    });
  }

  @override
  void initState() {
    super.initState();
    loadFormasFromApi();
  }

  Future<void> loadFormasFromApi() async {
    try {
      final List<dynamic>? data = await ComprarService.getFormasFromApi();
      print(data);
      if (data != null) {
        setState(() {
          formas = List<Map<String, dynamic>>.from(data.map((item) => {
                'id': item['id'].toString(),
                'nome': item['nome'],
                'tipo': item['tipo'],
                'valor_m2': item['valor_m2'],
              }));
        });
      }
    } catch (error) {
      Get.defaultDialog(
        title: 'Erro',
        content: const Text('Erro ao carregar as Formas.'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    }
  }

  void calcularValorTapete() {
    if (selectedForma != null &&
        tamanhoHorizontal != null &&
        tamanhoVertical != null) {
      final formaSelecionada =
          formas.firstWhere((forma) => forma['id'] == selectedForma);
      final double valorM2 = formaSelecionada['valor_m2'];
      final double metrosQuadrados = tamanhoHorizontal! * tamanhoVertical!;
      setState(() {
        valorFinal = valorM2 * metrosQuadrados;
      });
    } else {
      Get.snackbar(
        'Erro',
        'Por favor, preencha todos os campos antes de calcular.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void efetuarCompra() {
    if (selectedForma != null &&
        tamanhoHorizontal != null &&
        tamanhoVertical != null) {
      Get.snackbar(
        'Sucesso!',
        'Sua compra foi encaminhada com sucesso!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 0, 116, 60),
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Erro',
        'Por favor, preencha todos os campos antes de comprar.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Menu de Compra',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              goTo(Routes.HOME);
            },
          ),
          backgroundColor: const Color.fromARGB(255, 57, 16, 0),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: CustomDrawer(_pageController),
        body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      'Crie o seu modelo de tapete',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (formas.isNotEmpty)
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Formas',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                        ),
                      ),
                      value: selectedForma,
                      onChanged: (value) {
                        setState(() {
                          selectedForma = value;
                        });
                      },
                      items: formas.map<DropdownMenuItem<String>>((forma) {
                        return DropdownMenuItem<String>(
                          value: forma['id'],
                          child: Text(forma['nome']),
                        );
                      }).toList(),
                    )
                  else
                    const Center(child: CircularProgressIndicator()),
                  const SizedBox(height: 10),
                  if (selectedForma != null)
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Tamanho Horizontal (metros)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          tamanhoHorizontal = double.tryParse(value);
                        });
                      },
                    ),
                  const SizedBox(height: 10),
                  if (selectedForma != null)
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Tamanho Vertical (metros)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          tamanhoVertical = double.tryParse(value);
                        });
                      },
                    ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 65,
                    child: ElevatedButton(
                      onPressed: calcularValorTapete,
                      child: const Text('Calcular Valor do Tapete'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Valor: R\$ ${valorFinal.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (selectedForma != null)
                    SizedBox(
                      height: 65,
                      child: ElevatedButton(
                        onPressed: efetuarCompra,
                        child: const Text('Comprar'),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
