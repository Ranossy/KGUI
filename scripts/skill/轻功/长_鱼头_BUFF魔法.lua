---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/轻功/长_鱼头_BUFF魔法.lua
-- 更新时间:	2015/10/7 9:32:40
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
-- 鱼头实测备注：一个BUFF的魔法脚本中的Apply 函数，在添加此BUFF时候触发一次
-- 鱼头实测备注：一个BUFF的魔法脚本中的UnApply 函数，在此BUFF消失时候触发一次各种条件均会触发（维持条件不符合消失，player.DelBuff(8475,1)消失，时间到了消失）
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then

		if player.dwForceID == 22 then --长歌
			player.SetPassiveVelocityXY(200)
			player.SetPassiveVelocityZ(-60)
		elseif player.dwForceID == 2 then --万花
			player.SetPassiveVelocityXY(500)
			player.SetPassiveVelocityZ(-90)
		elseif player.dwForceID == 5 then --七秀
			player.SetPassiveVelocityXY(700)
			player.SetPassiveVelocityZ(-80)
		elseif player.dwForceID == 7 then --唐门
			if player.nJumpCount <= 7 then--从第七段之前进入
				player.SetPassiveVelocityXY(1000)
				player.SetPassiveVelocityZ(-100)
			elseif player.nJumpCount == 8 then--从第八段进入
				player.SetPassiveVelocityXY(1200)
				player.SetPassiveVelocityZ(-200)
			else
				player.SetPassiveVelocityXY(800)
				player.SetPassiveVelocityZ(-60)
			end
		elseif player.dwForceID == 6 then --五毒
			player.SetPassiveVelocityXY(600)
			player.SetPassiveVelocityZ(-60)
		else--通用其他
			player.SetPassiveVelocityXY(800)
			player.SetPassiveVelocityZ(-60)
		end
		
		player.LockPassiveDirectionXYByFace()
	end
end
--
-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetPassiveVelocityXY(0)
		player.SetPassiveVelocityZ(0)
		player.UnlockPassiveDirectionXYByFace()
		player.SetHangVelocity(0, 0)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com