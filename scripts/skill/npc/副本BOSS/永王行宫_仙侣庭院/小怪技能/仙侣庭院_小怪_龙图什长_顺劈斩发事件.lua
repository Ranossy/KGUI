---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_����ͥԺ/С�ּ���/����ͥԺ_С��_��ͼʲ��_˳��ն���¼�.lua
-- ����ʱ��:	2015/8/5 16:59:16
-- �����û�:	CHENJINGRU
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	npc.FireAIEvent(2003, 0, 0)
end

function UnApply(dwCharacterID)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com