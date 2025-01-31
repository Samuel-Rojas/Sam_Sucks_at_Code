import ast
import os
from typing import Dict, List

class CodeAnalyzer:
    def __init__(self):
        self.metrics = {
            'function_count': 0,
            'class_count': 0,
            'lines_of_code': 0,
            'comment_lines': 0
        }
        
    def analyze_file(self, file_path: str) -> Dict:
        """Analyze a Python file and extract basic metrics."""
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()
                
            # Parse the code into an AST
            tree = ast.parse(content)
            
            # Reset metrics for new file
            self.metrics = {key: 0 for key in self.metrics}
            
            # Analyze the AST
            self._analyze_node(tree)
            
            # Count lines and comments
            self._count_lines(content)
            
            return self.metrics
            
    def _analyze_node(self, node):
        """Recursively analyze AST nodes."""
        if isinstance(node, ast.FunctionDef):
            self.metrics['function_count'] += 1
        elif isinstance(node, ast.ClassDef):
            self.metrics['class_count'] += 1
            
        # Recurse through child nodes
        for child in ast.iter_child_nodes(node):
            self._analyze_node(child)
            
    def _count_lines(self, content: str):
        """Count total lines and comment lines."""
        lines = content.split('\n')
        self.metrics['lines_of_code'] = len(lines)
        self.metrics['comment_lines'] = sum(
            1 for line in lines if line.strip().startswith('#')
        )
        
    def suggest_improvements(self, metrics: Dict) -> List[str]:
        """Generate basic improvement suggestions based on metrics."""
        suggestions = []
        
        if metrics['function_count'] > 10:
            suggestions.append(
                "Consider splitting this file into multiple modules for better organization"
            )
        
        if metrics['comment_lines'] / metrics['lines_of_code'] < 0.1:
            suggestions.append(
                "Code might benefit from more documentation"
            )
            
        return suggestions

# Usage example
if __name__ == "__main__":
    analyzer = CodeAnalyzer()
    
    # Analyze a sample file
    sample_path = "path_to_your_file.py"
    if os.path.exists(sample_path):
        metrics = analyzer.analyze_file(sample_path)
        print("Code Metrics:", metrics)
        
        suggestions = analyzer.suggest_improvements(metrics)
        print("\nSuggestions:", suggestions)