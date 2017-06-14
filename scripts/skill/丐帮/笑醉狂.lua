---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/ؤ��/Ц���.lua
-- ����ʱ��:	2013/9/5 14:48:02
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ����	
-- ����ʱ��	:  2007-12-11
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/ؤ��/Ц���.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	
	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�
	
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(590);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 607);	--������ͨCD
	skill.SetCheckCoolDown(1, 444)	
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	-- ����CD
	--skill.SetPublicCoolDown(590);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 607);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
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
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	skill.nChannelInterval = 17; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval = 1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	skill.nChannelFrame = 153;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame = 1;	 			-- ͨ��������ʱ�䣬��λ֡�� 
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
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	skill.nBrokenRate = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	skill.nWeaponDamagePercent = 0; -- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	skill.nWeaponDamagePercent = 0; -- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		if player.nMoveState == 9 or player.nMoveState == 27 then
			player.Stop()
		end
		player.DelMultiGroupBuffByFunctionType(2)
		player.DelMultiGroupBuffByFunctionType(3)
		player.DelMultiGroupBuffByFunctionType(4)
		player.DelMultiGroupBuffByFunctionType(8)
		player.DelMultiGroupBuffByFunctionType(7)
		player.DelMultiGroupBuffByFunctionType(11)
		player.AddBuff(player.dwID, player.nLevel, 5995, 1, 1)
		if player.GetSkillLevel(6829) == 1 then
			if player.IsSkillRecipeActive(1382, 1) then
				player.AddBuff(player.dwID, player.nLevel, 5996, 4, 1)
			else
				player.AddBuff(player.dwID, player.nLevel, 5996, 3, 1)
			end
		else
			if player.IsSkillRecipeActive(1382, 1) then
				player.AddBuff(player.dwID, player.nLevel, 5996, 2, 1)
			else
				player.AddBuff(player.dwID, player.nLevel, 5996, 1, 1)
			end
		end

		--Ц������Buff
		if player.GetSkillLevel(6829) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6375, 1, 1)
		end

		--Ц����ڼ䱻����Ѫ���buff
		if player.GetSkillLevel(6828) == 1 then
			player.AddBuff(player.dwID, player.nLevel, 9717, 1)
		end
		
		return nPreResult;
	end
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	--�з�����Ѩ����ظ�����
	if player.GetSkillLevel(6828) == 1 then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.06
	else
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.02
	end
	player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.02
	--]]
	--�ؼ��ظ�2%��Ѫ������
	if player.IsSkillRecipeActive(1383, 1) then
		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.02
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.02
	end

	--����ÿ���8%��Ѫ
	if player.GetSkillLevel(6828) == 1 then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.08
	end
	
	--���
	player.AddBuff(dwCharacterID, player.nLevel, 5995, 1, 1)
	--����
	player.AddBuff(dwCharacterID, player.nLevel, 6375, 1, 1)

	--Ц����ڼ䱻����Ѫ���buff
	if player.GetSkillLevel(6828) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9717, 1)
	end
	
	if player.GetSkillLevel(6829) == 1 then
		if player.IsSkillRecipeActive(1382, 1) then
			player.AddBuff(player.dwID, player.nLevel, 5996, 4, 1)	--95%����
		else
			player.AddBuff(player.dwID, player.nLevel, 5996, 3, 1)	--90%����
		end
	else
		if player.IsSkillRecipeActive(1382, 1) then
			player.AddBuff(player.dwID, player.nLevel, 5996, 2, 1)	--55%����
		else
			player.AddBuff(player.dwID, player.nLevel, 5996, 1, 1)	--50%����
		end
	end

	

	--��ǰ���ܽ��͵�Ϣʱ���buffҲ������
	local nBuff = player.GetBuff(6375, 1)
	if not nBuff then
		return
	end	

	nBuff.nCustomValue = nBuff.nStackNum

	if nBuff.nStackNum == 9 then

		--�����ظ�50%�����������ӿ����˺�
		if player.GetSkillLevel(6828) == 1 then
			--player.ClearCDTime(602)
			player.nCurrentMana = player.nMaxMana * 0.5 + player.nCurrentMana
			player.nCurrentLife = player.nMaxLife * 0.3 + player.nCurrentLife
			--player.AddBuff(player.dwID, player.nLevel, 7118, 1, 1)
		end

		--ɾ��Ц����ڼ䱻����Ѫ���buff
		if player.GetBuff(9717, 1) then
			player.DelGroupBuff(9717, 1)
		end
		
		--[[
		--�������ظ���Ѫ
		if player.GetSkillLevel(6829) == 1 and player.nMoveState ~= MOVE_STATE.ON_DEATH then
			player.nCurrentLife = player.nMaxLife * 0.3 + player.nCurrentLife
		end
		--]]
		
		--Ц�������
		if player.GetSkillLevel(6842) == 1 then
			--player.ClearCDTime(600)
			player.AddBuff(dwCharacterID, player.nLevel, 6812, 1, 1)
		end
		
		--����������в���Ч��
		if player.GetSkillLevel(6828) == 1 then
			player.CastSkill(14627, 1)
		end
	end	
	--if player.GetSkillLevel(6842) == 1 then
	--player.AddBuff(player.dwID, player.nLevel, 5996, 3, 1)
	--end
	ModityCDToUI(player, 5270, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com