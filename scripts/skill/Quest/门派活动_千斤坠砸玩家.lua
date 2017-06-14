---------------------------------------------------------------------->
-- �ű�����:	f:/zhugan/client/scripts/skill/Quest/���ɻ_ǧ��׹�����.lua
-- ����ʱ��:	2012/11/27 17:13:10
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/Quest/���ɻ_ǧ��׹�����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"Map/ACT_��������/skill/���֡�ǧ��׹������.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	skill.BindBuff(1, 4990, 1);		-- ����1��λBuff
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
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 4 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit = 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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
	for i = 1, 4 do
		player.AddBuff(0, 99, 4991, 1, 8)
	end
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	--print("ִ�вȵ���ҽű���")
	local playerSkill = GetPlayer(dwSkillSrcID)
	local playerCharacter = GetPlayer(dwCharacterID)
	if not playerSkill or not playerCharacter then
		return
	end
	local buff4994OfCharacter = playerCharacter.GetBuff(4994, 1)
	if not buff4994OfCharacter then 
		return
	end
	playerCharacter.PlaySfx(328,0,0,0)
	local buff4992OfCharacter = playerCharacter.GetBuff(4992, 1)
	local buff4990OfCharcter = playerCharacter.GetBuff(4990, 1)
	if buff4992OfCharacter  or buff4990OfCharcter then
		if playerSkill.GetBuff(4992,1) then
			playerSkill.DelBuff(4992,1)
		end
		if player.GetBuff(4995,1) then
			for i = 1,player.GetBuff(4995,1).nStackNum do
				player.DelBuff(4995,1)
			end
		end
		return
	end
	if buff4994OfCharacter and not buff4992OfCharacter then
		local buff4809OfCharacter = playerCharacter.GetBuff(4809, 1)
		local buff4809OfSkill = playerSkill.GetBuff(4809, 1)
		local nStack4809OfCharacter = 0
		local nStack4809OfSkill = 0
		if buff4809OfCharacter then
			nStack4809OfCharacter = buff4809OfCharacter.nStackNum
		end
		if buff4809OfSkill then
			nStack4809OfSkill = buff4809OfSkill.nStackNum
		end
		local Deta = nStack4809OfCharacter - nStack4809OfSkill
		if Deta > 30 then
			Deta = 30
		end
		if Deta < -30 then
			Deta = -30
		end
		if playerSkill.GetBuff(4992,1) then
			playerSkill.DelBuff(4992,1)
		end
		if playerSkill.GetBuff(4995,1) then
			for i = 1,playerSkill.GetBuff(4995,1).nStackNum do
				playerSkill.DelBuff(4995,1)
			end
		end
		local nStack4995OfCharacter = 0
		if playerCharacter.GetBuff(4995,1) then
			nStack4995OfCharacter = playerCharacter.GetBuff(4995,1).nStackNum
		end
		local nDelLevel = math.floor(5 * (Deta / 30 + 1)) + 1
		local nAddLevel = math.floor(5 * (Deta / 30 + 1) * 0.1 * (10 - nStack4995OfCharacter))
		if buff4809OfCharacter then
			local nDelNum = math.min(nDelLevel, buff4809OfCharacter.nStackNum)
			for i =1,nDelNum do
				playerCharacter.DelBuff(4809,1)
			end
		end
		if nStack4809OfSkill < 100  and nAddLevel >= 1 then
			for i = 1, math.min(nAddLevel, 100 - nStack4809OfSkill) do
				playerSkill.AddBuff(0,99,4809,1,360)
			end
		end
		if nStack4995OfCharacter <= 8 then
			playerCharacter.AddBuff(0,99,4995,1)
		elseif nStack4995OfCharacter == 9 then
			playerCharacter.AddBuff(0, 99, 4992, 1)
			if playerCharacter.GetAchievementCount(3387) == 0 then
				playerCharacter.AddAchievementCount(3387,1)
			end
			for i = 1, 9 do
				playerCharacter.DelBuff(4995,1)
			end
		end
	end
 ----------------------------------------------------------- >    �����ķָ���
	--local tplayer = GetPlayer(dwCharacterID)
	--local splayer = GetPlayer(dwSkillSrcID)
	--local buff1 = tplayer.GetBuff(4994, 1)
	--local buff2 = tplayer.GetBuff(4992, 1)
	--if not buff1 then
		--if buff2 then
			--splayer.DelBuff(4992, 1)
			--for i = 1, 10 do
				--splayer.DelBuff(4995, 1)
			--end
		--end
	--end
	--local x = splayer.GetBuff(4809, 1).nStackNum
	--local y = tplayer.GetBuff(4809, 1).nStackNum
	--local deta = y-x
	--if deta > 30 then
		--deta = 30
	--elseif deta < -30 then
		--deta = -30
	--end
	--local nLevel = tplayer.GetBuff(4995, 1).nStackNum
	--if buff1 and not buff2 then
		--splayer.DelBuff(4992, 1)
		--for i = 1, 10 do
			--splayer.DelBuff(4995, 1)
		--end
		--for i = 1, math.floor(5 * (deta / 30 + 1)) do
			--tplayer.DelBuff(4809, 1)
		--end
		--for i = 1, math.floor(5 * (deta / 30 + 1) * 0.1 * (10-nLevel)) do
			--splayer.AddBuff(0, 99, 4809, 1)
		--end
		--if nLevel < 9 then
			--tplayer.AddBuff(0, 99, 4995, 1)
		--elseif nLevel == 9 then
			--for i = 1, 10 do
				--tplayer.DelBuff(4995, 1)
			--end
			--tplayer.AddBuff(0, 99, 4992, 1)
		--end
	--end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com