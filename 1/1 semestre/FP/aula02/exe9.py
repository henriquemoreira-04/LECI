ctp = float(input("nota ctp? (de 0 a 20):" ))
cp = float(input("nota cp? (de 0 a 20):" ))

nfinal = float(ctp*0.30 + cp*0.70)

if nfinal > 9.5:
    print("paso con la nota de {:.2f}".format(nfinal))

if (ctp or cp) < 6.5:
    print("66")

if nfinal < 9.5:
    atpr = float(input("nota rctp? (de 0 a 20):" ))
    apr = float(input("nota rcp? (de 0 a 20):" ))
    nrecur = 0.3 *atpr + 0.7 * apr
    if nrecur < 9.5:
        print("paso con la nota de recurso de {:.2f}".format(nrecur))
    else:
        print("paso con la nota de recurso de {:.2f}".format(nrecur))

     

