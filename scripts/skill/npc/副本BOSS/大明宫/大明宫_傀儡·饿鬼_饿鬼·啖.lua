------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-4-10
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
		"skill/npc/����BOSS/������/������_���ܡ�����_�����.lua",								--����ֵ1
		0															--����ֵ2
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
	skill.BindBuff(1, 6180, 1);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
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
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange		= 85;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius		= 20 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	  skill.nChannelInterval	= 16; 				-- ͨ�������ʱ�� 
	  skill.nChannelFrame		= 96;	 			-- ͨ��������ʱ�䣬��λ֡�� 
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
	skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
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

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	--print("11111")
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if scene.dwMapID == 164 then
		local nKongfu = player.GetKungfuMount()
		if not nKongfu then
			if player.nCurrentMana > player.nMaxMana * 0.02 then
				player.nCurrentMana = player.nCurrentMana - player.nMaxMana * 0.02
			else
				player.nCurrentMana = 0	
			end
		elseif nKongfu.dwSkillID == 10144 or nKongfu.dwSkillID == 10145 or nKongfu.dwSkillID == 10242 or nKongfu.dwSkillID == 10243 or nKongfu.dwSkillID == 10224 or nKongfu.dwSkillID == 10225 then
			if player.nCurrentLife < 7900 then
				player.Die()
			else
				player.nCurrentLife = player.nCurrentLife -7900
			end
		else
			if player.nCurrentMana > player.nMaxMana * 0.02 then
				player.nCurrentMana = player.nCurrentMana - player.nMaxMana * 0.02
			else
				if player.nCurrentLife < 7900 then
					player.Die()
				else
					player.nCurrentLife = player.nCurrentLife -7900
				end
			end
		end
		local nBuff1 = player.GetBuff(5568, 1)	--��buff
		local nBuff2 = player.GetBuff(5569, 1)
		if not nBuff1 and not nBuff2 then
			return
		elseif nBuff1 and not nBuff2 then
			if nBuff1.nStackNum < 11 then
				player.AddBuff(0, 99, 5592, 1)
			elseif nBuff1.nStackNum < 21 then
				player.AddBuff(0, 99, 5592, 2)
			else
				player.AddBuff(0, 99, 5592, 3)
			end
		elseif not nBuff1 and nBuff2 then
			if nBuff2.nStackNum < 11 then
				player.AddBuff(0, 99, 5595, 1)
			elseif nBuff2.nStackNum < 21 then
				player.AddBuff(0, 99, 5595, 2)
			else
				player.AddBuff(0, 99, 5595, 3)
			end
		elseif nBuff1 and nBuff2 then
			if nBuff1.nStackNum < nBuff2.nStackNum then
				if nBuff2.nStackNum < 11 then
					player.AddBuff(0, 99, 5595, 1)
				elseif nBuff2.nStackNum < 21 then
					player.AddBuff(0, 99, 5595, 2)
				else
					player.AddBuff(0, 99, 5595, 3)
				end
			else
				if nBuff1.nStackNum < 11 then
					player.AddBuff(0, 99, 5592, 1)
				elseif nBuff1.nStackNum < 21 then
					player.AddBuff(0, 99, 5592, 2)
				else
					player.AddBuff(0, 99, 5592, 3)
				end
			end
		end
	else
		if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
			player.AddBuff(0, 99, 6098, 1, 20)
		end
		local nKongfu = player.GetKungfuMount()
		if not nKongfu then
			if player.nCurrentMana > player.nMaxMana * 0.05 then
				player.nCurrentMana = player.nCurrentMana - player.nMaxMana * 0.05
			else
				player.nCurrentMana = 0	
			end
		elseif nKongfu.dwSkillID == 10144 or nKongfu.dwSkillID == 10145 or nKongfu.dwSkillID == 10242 or nKongfu.dwSkillID == 10243 or nKongfu.dwSkillID == 10224 or nKongfu.dwSkillID == 10225 then
			if player.nCurrentLife < 14200 then
				player.Die()
			else
				player.nCurrentLife = player.nCurrentLife -14200
			end
		else
			if player.nCurrentMana > player.nMaxMana * 0.05 then
				player.nCurrentMana = player.nCurrentMana - player.nMaxMana * 0.05
			else
				if player.nCurrentLife < 14200 then
					player.Die()
				else
					player.nCurrentLife = player.nCurrentLife -14200
				end
			end
		end
		local nBuff1 = player.GetBuff(5568, 1)
		local nBuff2 = player.GetBuff(5569, 1)
		if not nBuff1 and not nBuff2 then
			return
		elseif nBuff1 and not nBuff2 then
			if nBuff1.nStackNum < 6 then
				player.AddBuff(0, 99, 5592, 1)
			elseif nBuff1.nStackNum < 10 then
				player.AddBuff(0, 99, 5592, 2)
			else
				player.AddBuff(0, 99, 5592, 3)
			end
		elseif not nBuff1 and nBuff2 then
			if nBuff2.nStackNum < 6 then
				player.AddBuff(0, 99, 5595, 4)
			elseif nBuff2.nStackNum < 10 then
				player.AddBuff(0, 99, 5595, 5)
			else
				player.AddBuff(0, 99, 5595, 6)
			end
		elseif nBuff1 and nBuff2 then
			if nBuff1.nStackNum < nBuff2.nStackNum then
				if nBuff2.nStackNum < 6 then
					player.AddBuff(0, 99, 5595, 4)
				elseif nBuff2.nStackNum < 10 then
					player.AddBuff(0, 99, 5595, 5)
				else
					player.AddBuff(0, 99, 5595, 6)
				end
			else
				if nBuff1.nStackNum < 6 then
					player.AddBuff(0, 99, 5592, 1)
				elseif nBuff1.nStackNum < 10 then
					player.AddBuff(0, 99, 5592, 2)
				else
					player.AddBuff(0, 99, 5592, 3)
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com