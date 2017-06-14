---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/儿童节/糖果出炉表现延时.lua
-- 更新时间:	2015/5/27 19:11:12
-- 更新用户:	jiangzhefei1
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Map/节日儿童节/include/儿童节函数汇总.lua")

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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com