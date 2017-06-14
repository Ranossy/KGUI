---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/坚壁清野打击监控.lua
-- 更新时间:	2017/2/18 1:21:05
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<

-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	local scene = npc.GetScene()
	if npc.GetBuff(11722, 1) then
		local Nbuff = npc.GetBuff(11722, 1)
		local Num = Nbuff.nStackNum		--监控buff的层数
		if Num == 3 then
			if scene then
				local tDirection = {}
				tDirection[1] = npc.nFaceDirection
				tDirection[2] = npc.nFaceDirection - 30 % 256
				tDirection[3] = npc.nFaceDirection + 30 % 256
			for i = 1,  3 do
				local nY = npc.nY + math.floor(math.sin(tDirection[i] / 128 * math.pi) * 10 * 64)
				local nX = npc.nX + math.floor(math.cos(tDirection[i] / 128 * math.pi) * 10 * 64)
				local npcDt = scene.CreateNpc(55918, npc.nX, npc.nY, npc.nZ, npc.nFaceDirection, - 1)
				if npcDt then
					npcDt.RunTo(nX, nY)
				end
			end
		end			--3层召唤npc
	end
	end
end
-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com