---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���뵺/�ٻ�����BUFF.lua
-- ����ʱ��:	2013-4-10 16:41:57
-- �����û�:	xiedixun1
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then

		npc.CastSkill(5611, 1)
	end
end	
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com