---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��ͯ��/�ǹ���¯������ʱ.lua
-- ����ʱ��:	2015/5/27 19:11:12
-- �����û�:	jiangzhefei1
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Map/���ն�ͯ��/include/��ͯ�ں�������.lua")

function Apply(dwCharacterID, dwSkillSrcID)
	local npcMachine = GetNpc(dwCharacterID)
	if not npcMachine then
		return
	end
	npcMachine.SetDialogFlag(1)
	npcMachine.DelBuff(8952, 1)
	local scene = npcMachine.GetScene()
	if not scene then
		return
	end
	if scene then
		for i = 1, 9 do
			local npcDie = scene.GetNpcByNickName(npcMachine.szName .. "_" .. i)
			if npcDie then
				npcDie.Die()
			end
		end
	end
	SwitchCandyMachinePhase(npcMachine, 3)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com