---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_双曜亭/安庆绪/安庆绪_P4_恐惧.lua
-- 更新时间:	2016/9/11 11:00:30
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if scene then
		local MaxnX = 53433
		local MinnX = 50420
		local MaxnY = 51181
		local MinnY = 48156
		local nRandomX = Random(MinnX, MaxnX)
		local nRandomY = Random(MinnY, MaxnY)
		local nRanD = Random(256)
		player.TurnTo(nRanD)
		local nTargetY = player.nY + math.floor(math.sin(player.nFaceDirection / 128 * math.pi) * 10 * 64)
		local nTargetX = player.nX + math.floor(math.cos(player.nFaceDirection / 128 * math.pi) * 10 * 64)

		player.RunTo(nTargetX, nTargetY)
	end

end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com