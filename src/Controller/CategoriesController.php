<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * Categories Controller
 *
 * @property \App\Model\Table\CategoriesTable $Categories
 *
 * @method \App\Model\Entity\Category[]|\Cake\Datasource\ResultSetInterface paginate($object = null, array $settings = [])
 */
class CategoriesController extends AppController
{
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['ParentCategories'],
        ];
        $categories = $this->Categories->find() ->order(['lft' => 'ASC']);
        $this->set(compact('categories')); 
        $this->set('_serialize', ['categories']);

    }

    public function moveUp($id = null) { 
        $this->request->allowMethod(['post', 'put']); 
        $category = $this->Categories->get($id); 
            if ($this->Categories->moveUp($category)) { 
                $this->Flash->success('The category has been moved Up.');
            } else { 
                $this->Flash->error('The category could not be moved up. Please, try again.');
            } 
        return $this->redirect($this->referer(['action' => 'index'])); 
    }
    public function moveDown($id = null) { 
        $this->request->allowMethod(['post', 'put']); 
        $category = $this->Categories->get($id); 
        if ($this->Categories->moveDown($category)) { 
            $this->Flash->success('The category has been moved down.'); 
        } else { 
            $this->Flash->error('The category could not be moved down. Please, try again.'); 
        } 
        return $this->redirect($this->referer(['action' => 'index'])); 
    } 


    /**
     * View method
     *
     * @param string|null $id Category id.
     * @return \Cake\Http\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $category = $this->Categories->get($id, [
            'contain' => ['ParentCategories', 'Articles', 'ChildCategories'],
        ]);

        $this->set('category', $category);
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null Redirects on successful add, renders view otherwise.
     */
    public function add() { 
        $article = $this->Articles->newEntity(); 
        if ($this->request->is('post')) { 
            // Prior to 3.4.0 $this->request->data() was used. 
            $article = $this->Articles->patchEntity($article, $this->request->getData());
             if ($this->Articles->save($article)) { 
                 $this->Flash->success(__('Your article has been saved.'));
                return $this->redirect(['action' => 'index']); 
            } 
            $this->Flash->error(__('Unable to add your article.')); 
        } $this->set('article', $article);
        // Just added the categories list to be able to choose // one category for an article 
        $categories = $this->Articles->Categories->find('treeList'); 
        $this->set(compact('categories'));
    }
        

    /**
     * Edit method
     *
     * @param string|null $id Category id.
     * @return \Cake\Http\Response|null Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $category = $this->Categories->get($id, [
            'contain' => [],
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $category = $this->Categories->patchEntity($category, $this->request->getData());
            if ($this->Categories->save($category)) {
                $this->Flash->success(__('The category has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The category could not be saved. Please, try again.'));
        }
        $parentCategories = $this->Categories->ParentCategories->find('list', ['limit' => 200]);
        $this->set(compact('category', 'parentCategories'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Category id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $category = $this->Categories->get($id);
        if ($this->Categories->delete($category)) {
            $this->Flash->success(__('The category has been deleted.'));
        } else {
            $this->Flash->error(__('The category could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
