------------------------------------------------
-- ������   :  ����	
-- ����ʱ��	:  2007-12-11
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
   	skill.AddAttribute(
   			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
   			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		--	"skill/npc/����BOSS/������/������_��������_������.lua",								--����ֵ1
   			"skill/npc/����BOSS/��Ԩ��/��Ԩ��_��߹���Ů_��_����1(ĸ����).lua",
   			0															--����ֵ2
	  );
   	--[[
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- ��������ģʽ
   		ATTRIBUTE_TYPE.nAttributeKey,								-- ħ������
   		nAttributeValue1,											-- ����ֵ1
   		nAttributeValue2											-- ����ֵ2
   		);
    --]]
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    -- ����CD
    --skill.SetPublicCoolDown(16);							-- ����CD 1.5��
    -- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
    --skill.nCostStamina	= 0;									-- �������ĵ�����
    --skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 4 * LENGTH_BASE;		-- �������ð뾶 
    --skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- Ŀ��Ѫ������ ---------------------------------------------
    --skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
    --skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
    ----------------- ����Ѫ������ ---------------------------------------------
    --skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=
    
    ----------------- ���˴��������� -------------------------------------------------
    --skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    --skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
    return true;
end



-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

function FxFindTarget(cTarget, nType)
	local pTargetType, pTargetID = cTarget.GetTarget()
	if pTargetType == nType then
		if pTargetType == TARGET.PLAYER then
			local cPlayer = GetPlayer(pTargetID)
			if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
				return cPlayer
			end
		elseif pTargetType == TARGET.NPC then
			local cNpc = GetNpc(pTargetID)
			if cNpc then
				return cNpc
			end
		end
	elseif nType == 0 then
		if pTargetType == TARGET.PLAYER then
			local cPlayer = GetPlayer(pTargetID)
			if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
				return cPlayer
			end
		elseif pTargetType == TARGET.NPC then
			local cNpc = GetNpc(pTargetID)
			if cNpc then
				return cNpc
			end
		end
	else
		return false
	end
end

function Fx_TargetAngle(npc, Target)
	local xxNpc_2D_X = npc.nX - Target.nX
	local xxNpc_2D_Y = npc.nY - Target.nY
	local xxNpc_3D_X = math.sqrt(xxNpc_2D_X ^ 2 + xxNpc_2D_Y ^ 2)
	local xxNpc_Angle = math.deg(math.asin(math.abs(xxNpc_2D_X) / math.abs(xxNpc_3D_X)))
	if xxNpc_2D_X < 0 and xxNpc_2D_Y < 0 then
		xxNpc_Angle = 90 - xxNpc_Angle
	elseif xxNpc_2D_X >= 0 and xxNpc_2D_Y <= 0 then
		xxNpc_Angle = xxNpc_Angle + 90
	elseif xxNpc_2D_X >= 0 and xxNpc_2D_Y >= 0 then
		xxNpc_Angle = 90 - xxNpc_Angle + 180
	elseif xxNpc_2D_X <= 0 and xxNpc_2D_Y >= 0 then
		xxNpc_Angle = xxNpc_Angle + 270
	end
	return math.floor(xxNpc_Angle / 360 * 255)
end
-----------------------------------------------------------
function FightAreaLimit_Square(cTarget, tArea, bArea)
	if bArea == nil then
		bArea = true
	end
	local x, y = cTarget.nX, cTarget.nY
	local xMax = 0
	local xMin = 0
	local yMax = 0
	local yMin = 0
	if tArea[1] > tArea[3] then
		xMax = tArea[1]
		xMin = tArea[3]
	else
		xMax = tArea[3]
		xMin = tArea[1]
	end
	if tArea[2] > tArea[4] then
		yMax = tArea[2]
		yMin = tArea[4]
	else
		yMax = tArea[4]
		yMin = tArea[2]
	end
	if x > xMax or x < xMin or y > yMax or y < yMin then
		if IsPlayer(cTarget.dwID) and bArea then
			cTarget.AddBuff(0, 99, 2685, 1)
			cTarget.AddBuff(0, 99, 2684, 1)
		end
		return false		--������
	else
		if IsPlayer(cTarget.dwID) and bArea then
			local xInMax = xMax - (6 * 64)
			local xInMin = xMin + (6 * 64)
			local yInMax = yMax - (6 * 64)
			local yInMin = yMin + (6 * 64)
			if x > xInMax or x < xInMin or y > yInMax or y < yInMin then
				cTarget.AddBuff(0, 99, 2684, 1)
			else
				cTarget.DelBuff(2684, 1)
			end
			cTarget.DelBuff(2685, 1)
		end
		return true		--������
	end
end

function FightAreaLimit_Circular(cTarget, tArea, bArea)
	if bArea == nil then
		bArea = true
	end
	local x, y = cTarget.nX, cTarget.nY
	local nPlayerSpace = math.sqrt((x - tArea[1]) ^ 2 + (y - tArea[2]) ^ 2)
	local nLimit = math.sqrt((tArea[3] - tArea[1]) ^ 2 + (tArea[4] - tArea[2]) ^ 2)
	if nPlayerSpace > nLimit then
		if IsPlayer(cTarget.dwID) and bArea then
			cTarget.AddBuff(0, 99, 2685, 1)
			cTarget.AddBuff(0, 99, 2684, 1)
		end
		return false
	else
		if IsPlayer(cTarget.dwID) and bArea then
			local nInLimit = nLimit - (6 * 64)
			if nPlayerSpace > nInLimit then
				cTarget.AddBuff(0, 99, 2684, 1)
			else
				cTarget.DelBuff(2684, 1)
			end
			cTarget.DelBuff(2685, 1)
		end
		return true
	end
end

function FightAreaLimit_Z(cTarget, tArea)
	local z = cTarget.nZ
	if z > (tArea[1] + tArea[2]) or z < (tArea[1] - tArea[2]) then
		return false
	else
		return true
	end
end

function Fx_AllPlayer(scene)
	if scene.nType ~= MAP_TYPE.DUNGEON then
		return false
	end
	local tTatget = {}
	local tPlayer = scene.GetAllPlayer()
	if tPlayer then
		for i = 1, #tPlayer do
			local cPlayer = GetPlayer(tPlayer[i])
			if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
				tTatget[#tTatget + 1] = cPlayer
			end
		end
		if #tTatget == 0 then
			return false
		else
			return tTatget
		end
	end
end
-----------------------------------------------------------
function Fx_RandomTargetInArea(scene, nType, tArea)
	local tTatget = {}
	local tPlayer = Fx_AllPlayer(scene)
	if tPlayer then
		for i = 1, #tPlayer do
			local cPlayer = tPlayer[i]
			local bIn = false
			if nType == 1 then
				bIn = FightAreaLimit_Square(cPlayer, tArea)
			elseif nType == 2 then
				bIn = FightAreaLimit_Circular(cPlayer, tArea)
			elseif nType == 3 then
				bIn = FightAreaLimit_Z(cPlayer, tArea)
			end
			if bIn then
				tTatget[#tTatget + 1] = cPlayer
			end
		end
		if #tTatget == 0 then
			return false
		else
			return tTatget[Random(1, #tTatget)]
		end
	end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then
		local scene = npc.GetScene()
		if scene then
			local Lv = 1
			if scene.dwMapID == 118 then
				Lv = 2
			elseif scene.dwMapID == 119 then
				Lv = 3
			elseif scene.dwMapID == 117 then
				Lv = 4
			end
			local npcBossWoman = scene.GetNpcByNickName("Boss_1_Woman")
			if npcBossWoman then
				local cPlayer = FxFindTarget(npcBossWoman, TARGET.PLAYER)
				if cPlayer then
					npc.TurnTo(Fx_TargetAngle(npc, cPlayer))
					npc.CastSkill(2791, Lv, TARGET.PLAYER, cPlayer.dwID)
					npc.SetCustomUnsigned4(10, cPlayer.dwID)
				else
					local tArea = {npc.nX, npc.nY, npc.nX + (64 * 30), npc.nY + (64 * 30)}
					cPlayer = Fx_RandomTargetInArea(scene, 2, tArea)
					if cPlayer then
						npc.TurnTo(Fx_TargetAngle(npc, cPlayer))
						npc.CastSkill(2791, Lv, TARGET.PLAYER, cPlayer.dwID)
						npc.SetCustomUnsigned4(10, cPlayer.dwID)
					end
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com