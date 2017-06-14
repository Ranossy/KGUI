---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/ACT_95级门派事件/万花_暂不需要照料.lua
-- 更新时间:	2015/12/7 15:59:50
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
local BUFFID = 10316
local tBuffList = {
	-- [等级] = 状态
	[1] = GetEditorString(9, 1299),
	[2] = GetEditorString(9, 1300),
	[3] = GetEditorString(9, 1301),
	[4] = GetEditorString(9, 1302),
}

-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local i = Random(2, #tBuffList)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	npc.AddBuff(0, 99, BUFFID, i)
--	npc.Say(tBuffList[i])
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com