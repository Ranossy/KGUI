---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_����ͥԺ/3��_�ؿ�/�������.lua
-- ����ʱ��:	2015/8/26 20:46:03
-- �����û�:	WANGZEYU
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	print("script entered")
	local Target = GetNpc(dwCharacterID)
	if not Target then
		return
	end

	Target.CastSkill(14529, 1)
	
	if Target.GetCustomInteger1(1) > 0 and Target.GetCustomInteger1(1) <= 5 then
		Target.FireAIEvent(2001, 0, 0)
	elseif Target.GetCustomInteger1(1) > 5 then
		Target.FireAIEvent(2002, 0, 0)
	end

	--Target.AddBuff(0, 99, 9565, 1)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com