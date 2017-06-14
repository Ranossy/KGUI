---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/英雄雷狼_忠魂转换.lua
-- 更新时间:	2013/11/27 16:13:34
-- 更新用户:	liguanghao2
-- 脚本说明:	
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
	
	local npcLeilangZK = scene.GetNpcByNickName("leilangzongkong")
	local nLanghun = 0
	if npcLeilangZK then
		nLanghun = npcLeilangZK.GetCustomInteger4(29)
	end
	
	local npcBoss = scene.GetNpcByNickName("leilang")
	if npcBoss then
		if nLanghun == 0 then
			local npcLeilangZK = scene.GetNpcByNickName("leilangzongkong")
			if npcLeilangZK then
				npcLeilangZK.SetCustomInteger4(29, 0)
			end
			return
		elseif nLanghun == 1 then
			npcBoss.AddBuff(0, 99, 7034, 2)
			local npcLeilangZK = scene.GetNpcByNickName("leilangzongkong")
			if npcLeilangZK then
				npcLeilangZK.SetCustomInteger4(29, 0)
			end
		elseif nLanghun == 2 then
			local npcLeilangZK = scene.GetNpcByNickName("leilangzongkong")
			if npcLeilangZK then
				npcLeilangZK.SetCustomInteger4(29, 0)
			end
			npcBoss.AddBuff(0, 99, 7034, 2)
			npcBoss.AddBuff(0, 99, 7034, 2)
		end
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end	

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com