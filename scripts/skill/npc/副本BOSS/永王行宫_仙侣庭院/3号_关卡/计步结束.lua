---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_����ͥԺ/3��_�ؿ�/�Ʋ�����.lua
-- ����ʱ��:	2015/6/25 10:56:27
-- �����û�:	WANGZEYU
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local Target = GetNpc(dwCharacterID)
	if not Target then
		return
	end

	Target.FireAIEvent(2001, 0, 0)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com