---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����ڳ����߷�/Ⱥ����ʳ.lua
-- ����ʱ��:	2013/8/21 11:22:45
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	local scene = npc.GetScene()
	local boss = scene.GetNpcByNickName("shenmianfeng")
	if boss then
		boss.AddBuff(boss.dwID, boss.nLevel, 6542, 1, 1)
	end
	
	npc.PlaySfx(570, 0, 0, 0)
	npc.Die()
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com