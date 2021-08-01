
ArrayList<node> allNodes;
ArrayList<link> allLinks;
// Mode var: 0 = select, 1 = node, 2 = link
int mode;
boolean linking;
node nodeToLink;

void setup() {
  size(800, 600);
  allNodes = new ArrayList();
  allLinks = new ArrayList();
}

void draw() {
  background(200, 200, 200);
  color(0);
  for (link currLink : allLinks) {
    currLink.draw();
  }
  color(255);
  for (node currNode : allNodes) {
    currNode.draw();
  }
}

void keyPressed() {
  if (key == '1') {
    mode = 0;
  } else if (key == '2') {
    mode = 1;
  } else if (key == '3') {
    mode = 2;
  }
}

void mouseMoved() {
} 

void mouseDragged() {
  if (mode == 0) {
    for (node currNode : allNodes) {
      if (currNode.isClicked(mouseX, mouseY)) {
        currNode.addCoords(mouseX, mouseY);
        break;
      }
    }
  }
}

void mousePressed() { 
  if (mode == 1) {
    String name = "a";
    allNodes.add(new node(name, mouseX, mouseY));
  }
  if (mode == 2) {
    for (node currNode : allNodes) {
      if (currNode.isClicked(mouseX, mouseY)) {
        if (linking) {
          link newLink = new link(nodeToLink, currNode);
          allLinks.add(newLink);
          nodeToLink.links.add(newLink);
          currNode.links.add(newLink);
          linking = false;
          nodeToLink = null;
        } else {
          nodeToLink = currNode;
          linking = true;
        }
        break;
      }
    }
  }
}
