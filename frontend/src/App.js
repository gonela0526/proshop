import React from 'react';
import { Container } from 'react-bootstrap';
import Footer from './components/Footer';
import Header from './components/Header';

const App = () => {
  return (
    < >
     <Header />
    <main class="py-3">
      <Container>
      <h1>Welcome to the proshop.</h1>
        </Container>
    
    </main>
    <Footer />
     
    </>
  );
}

export default App;
