---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/ؤ��/ؤ�ﶯ���ͨ�ñ���.lua
-- ����ʱ��:	2013/9/27 11:46:22
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then
		if npc.nImmuneSkillMoveCount == 0 then
			npc.BeHitted(0, 1, 1, 28)
		end	
	end
	if not npc then
		return
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com