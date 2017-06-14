---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/RechargeableAbsorb.lua
-- 更新时间:	2015/8/3 17:37:35
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function OnAddAbsorbShield(character, dwSkillSrcID)
	--print(22222)
end

--第一个参数是作用目标的对象，第二个是释放者的ID，一定注意,盾之间的替换不会触发这个脚本
function OnRemoveAbsorbShield(character, dwSkillSrcID)
	local target = character

	if not target then
		return
	end
	--[[
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--]]
	--[[
	--这里是处理长歌的梅花三弄盾buff
	local buff_meihuasannong = target.GetBuff(9334, 1)
	if buff_meihuasannong then
		print(9)
		local nLeftFrame = buff_meihuasannong.nLeftActiveCount
		if player.GetSkillLevel(14249) == 1 then
			--持续减伤
			target.AddBuff(0, 99, 9337, 1, nLeftFrame)
			print("nLeftFrame"..nLeftFrame)
		else
			--一次性减伤
			target.AddBuff(0, 99, 9336, 1, nLeftFrame)
			print("nLeftFrame"..nLeftFrame)
		end

	end
	--盾吸收足够伤害提前消失返还内力
	if player.GetSkillLevel(14252) == 1 and target.nRechargeableAbsorbShieldValue == 0 then
		local nMax = player.nMaxMana
		local VitaToMana = player.nCurrentVitality * 2.25
		local kungFu_lev = player.GetSkillLevel(10448)
		local nkungmana = {347, 2110, 3148, 4187, 5224, 6262, 7300, 14278, 24378, 33084}
		local nManaBase
		if kungFu_lev ~= 0 then
			nManaBase = nMax - VitaToMana - nkungmana[kungFu_lev]
		else
			nManaBase = nMax - VitaToMana
		end
		print(nManaBase * 1500 / 1024)
		player.nCurrentMana = player.nCurrentMana + nManaBase * 1500 / 1024
	end
	--]]

	--删除会心buff和免控buff
	target.DelBuff(9341, 1)
	target.DelBuff(9342, 1)
	target.DelBuff(9334, 1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com