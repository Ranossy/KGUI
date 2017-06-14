---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/秦皇陵_安禄山_弱点暴露结束.lua
-- 更新时间:	2014/1/22 10:52:23
-- 更新用户:	ks13376-PC
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--[[print("jieshu")
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	print("jieshu2")
	for i = 1, 2 do
		npc.AddBuff(0, 99, 7392, 1)
	end--]]
end

function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npctarget = GetNpc(nCharacterID)
	if npctarget then
		local scene = npctarget.GetScene()
		local jieduankongzhi = scene.GetNpcByNickName("jieduanjiemiankongzhi")
		if jieduankongzhi then
			if jieduankongzhi.GetCustomInteger1(2) == 2 then
				if scene.dwMapID == 182 then
					for i = 1, 4 do
						npctarget.AddBuff(0, 99, 7392, 1)
					end
					npctarget.AddBuff(0, 99, 7605, 1)
				end

				if scene.dwMapID == 183 then
					for i = 1, 4 do
						npctarget.AddBuff(0, 99, 7392, 2)
					end
					npctarget.AddBuff(0, 99, 7605, 1)
				end
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com