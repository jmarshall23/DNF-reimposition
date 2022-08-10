struct SAIMessage
{
	var noexport Engine.BaseAI.EAIMessageType m_eType "Type of message.";
	var noexport Actor m_aFrom "Who the message came from.";
	var noexport Actor m_aSubject "Actor associated with this message.";
	var noexport int m_nData "Miscellaneous data.";
	var noexport float m_fTime "Time this message arrived.";
};