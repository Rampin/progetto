import { Component, OnInit } from '@angular/core';
import { ModelDataService } from '../model/model-data.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Modello } from '../model/model';
import { Marca } from '../model/brand';
import { QueryResult } from '../model/query-result';
import { UpdateResult } from '../model/update-result';
import { IfStmt } from '@angular/compiler';
import { BrandDataService } from '../model/brand-data.service';


@Component({
  selector: 'app-show-all-models',
  templateUrl: './show-all-models.component.html',
  styleUrls: ['./show-all-models.component.scss']
})
export class ShowAllModelsComponent implements OnInit {
  listaModelli: Array<Modello>;

  listaMarche: Array<Marca>;
  marche: {} = {};
  fondazioni: {} = {};
  website: {} = {};
  aux:string ="";

  messaggio: string;

  page = 1;
  pageSize = 4;
  collectionSize: number;

  nuovoModello: Modello;

  alertCtrl = false;

  constructor(private modelSvc: ModelDataService, private modalSvc: NgbModal, private brandSvc: BrandDataService) { }

  ngOnInit() {
    this.modelSvc.getAllModels()
      .subscribe((response: any) => {
        const queryResult: QueryResult = response;
        this.listaModelli = queryResult.esito.modello;
        this.collectionSize = this.listaModelli.length;
        if (this.collectionSize != 0) {
          for (let i = 0; i < this.collectionSize; i++) {
            this.brandSvc.getBrandById(this.listaModelli[i].idMarca)
              .subscribe((response: any) => {
                const queryResult: QueryResult = response;
                this.marche[this.listaModelli[i].idMarca] = queryResult.esito.marca[0].nome;
                this.fondazioni[this.listaModelli[i].idMarca]=queryResult.esito.marca[0].fondazione;
                this.website[this.listaModelli[i].idMarca]=queryResult.esito.marca[0].website;
              }, (error: any) => {
                setTimeout(() => {
                  this.messaggio = 'No models found!<br><br>HTTP error!<br><br>' + error.message;
                }, 7000);
              });
          }
        }
      }, (error: any) => {
        setTimeout(() => {
          this.messaggio = 'No models found!<br><br>HTTP error!<br><br>' + error.message;
        }, 7000);
      });
  }


  updateModel(modello: Modello, modalUpdate: any) {
    this.nuovoModello = modello;
    this.modalSvc.open(modalUpdate, { ariaLabelledBy: 'modal1-basic-title' });
  }
  finishUpdate() {
    this.modalSvc.dismissAll();
  }

  removeModel(id: number, modalRemove: any) {
    this.modalSvc.open(modalRemove, { ariaLabelledBy: 'modal2-basic-title' }).result
      .then((res) => {
        if (res) {
          this.modelSvc.removeModel(id)
            .subscribe((response: any) => {
              const updateResult: UpdateResult = response;
              if (updateResult.esito.modello.rimuovi) {
                this.listaModelli = this.listaModelli.filter((m: Modello) => m.idModello !== id);
                this.collectionSize = this.listaModelli.length;
                this.messaggio = 'Model data removed!';
              } else {
                this.messaggio = 'Error! Model data not removed!';
              }
              this.alertCtrl = true;
            }, (err: any) => {
              this.messaggio = 'HTTP error! ' + err.message;
              this.alertCtrl = true;
            });
        }
      });

  }



  closeAlert() {
    this.alertCtrl = false;
  }

}
