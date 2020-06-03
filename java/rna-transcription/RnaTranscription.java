import java.util.HashMap;

class RnaTranscription {

    static HashMap<Character, Character> transcription_table = new HashMap<Character, Character>();
    static {
        transcription_table.put('C', 'G');
        transcription_table.put('G', 'C');
        transcription_table.put('T', 'A');
        transcription_table.put('A', 'U');
    }

    String transcribe(String dnaStrand) {
        StringBuffer rnaStrand = new StringBuffer(dnaStrand);
        for (int i = 0; i < rnaStrand.length(); i++) {
            rnaStrand.setCharAt(i, transcription_table.get(rnaStrand.charAt(i)));
        }

        return rnaStrand.toString();
    }

}
