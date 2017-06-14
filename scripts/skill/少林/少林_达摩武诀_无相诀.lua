---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_��Ħ���_�����.lua
-- ����ʱ��:	2013/6/1 4:50:32
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_��Ħ���_������.lua
-- ������    :  �º���	
-- ����ʱ��  :  2008-07-18
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��Ħ���
-- ��������  :  ������
-- ����Ч��  :  �����⹦�������ڹ�����������30����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nCostMana = 69 }, --level 1
	{ nCostMana = 90 }, --level 2
	{ nCostMana = 110}, --level 3
	{ nCostMana = 130}, --level 4

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/����_��Ħ���_�����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 399, dwSkillLevel)			-- ����Buff
	--skill.BindBuff(2, 996, 1)			-- ����Buff
    
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 47);
	skill.SetCheckCoolDown(1, 444);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	-- skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
	skill.nCostManaBasePercent = 77;--�������ĵ�����
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	--skill.nMaxRadius		= 0;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius = 20 * LENGTH_BASE;		-- �������ð뾶 
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
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end


function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(55)
	end
	-- if player.IsAchievementAcquired(55) and player.IsAchievementAcquired(56) and player.IsAchievementAcquired(57) and player.IsAchievementAcquired(58) and player.IsAchievementAcquired(59) and player.IsAchievementAcquired(60) then
		-- player.AcquireAchievement(71)
	-- end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local lv = player.GetSkillLevel(261)
	--[[
	if player.GetSkillLevel(5901) == 1 then
		player.nCurrentLife = player.nMaxLife * 0.1 + player.nCurrentLife
		player.AddBuff(dwCharacterID, player.nLevel, 6416, 1, 1)
	end
	--]]
	--�����ڼ䷴���˺�
	if player.GetSkillLevel(5902) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 5703, 1, 1)
	end

	--�����Ѫ10%��������Ѫ
	if player.GetSkillLevel(6580) == 1 and not player.GetBuff(7913,1) and player.dwShapeShiftID == 0 then
		--player.DelMultiGroupBuffByFunctionType(2)
		--player.DelMultiGroupBuffByFunctionType(7)
		--player.AddBuff(dwCharacterID, player.nLevel, 6192, 1, 1)
		--player.nCurrentLife = player.nMaxLife * 0.1 + player.nCurrentLife
		player.AddBuff(dwCharacterID, player.nLevel, 6416, 1, 1)
	end

	--MT�����Ѫ��
	if player.GetSkillLevel(5901) == 1 and not player.GetBuff(7913,1) and player.dwShapeShiftID == 0 then
		player.nCurrentLife = player.nMaxLife * 0.2 + player.nCurrentLife
		player.AddBuff(dwCharacterID, player.nLevel, 6416, 2, 1)
	end

	--���ཱུ�͵�Ϣʱ�䡢����ʱ�併��5��
	local nTime = 10
	if player.GetSkillLevel(14754) == 1 then		 --�ʲ���Ѩ����ʱ�併��5��
		nTime = 10 - 5
	end
	if player.GetSkillLevel(5934) == 1 then  	 --��ɫ��Ѩ����ʱ�����5��
		nTime = 10 + 5
	end
	if player.IsSkillRecipeActive(306, 1) then	 --�ؼ�����ʱ���1��
		nTime = nTime + 1
	end
	if player.IsSkillRecipeActive(307, 1) then    --�ؼ�����ʱ���1��
		nTime = nTime + 1
	end

	--����Ѫ��ÿ����10%���˳���ʱ������1��
	if player.GetSkillLevel(14793) == 1 then
		nTime = nTime + (9-math.floor(player.nCurrentLife / player.nMaxLife * 10, 1))
		nTime = math.max(nTime, 0)
	end
	--[[
	print(11111111)
	if player.GetSkillLevel(5934) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 10486, lv, nTime)	--20%���˵�����
	end
	if player.IsSkillRecipeActive(305, 1) and player.GetSkillLevel(5934) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 10493, lv, nTime)	--25%���˵�����
	else
		player.AddBuff(player.dwID, player.nLevel, 399, lv, nTime)		--50%���˵�����
	end	
	if player.IsSkillRecipeActive(305, 1) then
		player.AddBuff(player.dwID, player.nLevel, 9803, lv, nTime)		--55%���˵�����
	end
	print(22222)
	--]]
	if player.GetSkillLevel(5934) == 1 then
		if player.IsSkillRecipeActive(305, 1) then
			player.AddBuff(player.dwID, player.nLevel, 10493, 1, nTime)		--25%���˵�����
		else
			player.AddBuff(player.dwID, player.nLevel, 10486, 1, nTime)		--20%���˵�����
		end
	else
		if player.IsSkillRecipeActive(305, 1) then
			player.AddBuff(player.dwID, player.nLevel, 9803, lv, nTime)		--55%���˵�����
		else
			player.AddBuff(player.dwID, player.nLevel, 399, lv, nTime)		--50���˵�����
		end
	end

	--�����2���޵�
	if player.GetSkillLevel(5938) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6213, 1, 1)
	end

	ModityCDToUI(player, 261, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com