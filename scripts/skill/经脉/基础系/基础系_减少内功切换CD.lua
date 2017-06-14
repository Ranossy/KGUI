------------------------------------------------
-- �ļ���    :  ����ϵ_�����ڹ��л�CD.lua
-- ������    :  CBG
-- ����ʱ��  :  2010-1-7
-- ��;(ģ��):  �书����
-- �书����  :  
-- �书����  : 
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{


};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����ϵ/����ϵ_�����ڹ��л�CD.lua",
		0
	);



	----------------- ����ʩ��Buff���� ---------------------------------------------
    
   
	----------------- BUFF��� -------------------------------------------------

	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    -- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
    -- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(1, 246);	

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
	skill.nMinRadius		= 1 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
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




--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end


function OnSkillLevelUp(skill, player)
end


--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID);
	if not player then
		return
	end
	local dwSkillLevel = player.GetSkillLevel(1572);
	if dwSkillLevel  > 0 then
		player.AddSkillRecipe(522,dwSkillLevel); 
		player.AddSkillRecipe(523,dwSkillLevel); 
		player.AddSkillRecipe(524,dwSkillLevel); 
		player.AddSkillRecipe(525,dwSkillLevel); 
		player.AddSkillRecipe(526,dwSkillLevel); 
		player.AddSkillRecipe(527,dwSkillLevel); 
		player.AddSkillRecipe(528,dwSkillLevel); 
		player.AddSkillRecipe(529,dwSkillLevel); 
		player.AddSkillRecipe(530,dwSkillLevel); 
		player.AddSkillRecipe(531,dwSkillLevel); 
		player.AddSkillRecipe(633,dwSkillLevel); 
		player.AddSkillRecipe(634,dwSkillLevel); 
		player.AddSkillRecipe(650,dwSkillLevel); 
		player.AddSkillRecipe(651,dwSkillLevel); 
		player.AddSkillRecipe(962,dwSkillLevel); 
		player.AddSkillRecipe(963, dwSkillLevel);
		player.AddSkillRecipe(1175,dwSkillLevel); 
		player.AddSkillRecipe(1176,dwSkillLevel); 
	end
end


--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID);
	local dwSkillLevel = player.GetSkillLevel(1572);
	for i = 1, 5 do 
		if player.IsSkillRecipeExist(522,i) then
			player.DelSkillRecipe(522,i);
		end
		if player.IsSkillRecipeExist(523,i) then
			player.DelSkillRecipe(523,i);
		end
		if player.IsSkillRecipeExist(524,i) then
			player.DelSkillRecipe(524,i);
		end
		if player.IsSkillRecipeExist(525,i) then
			player.DelSkillRecipe(525,i);
		end
		if player.IsSkillRecipeExist(526,i) then
			player.DelSkillRecipe(526,i);
		end
		if player.IsSkillRecipeExist(527,i) then
			player.DelSkillRecipe(527,i);
		end
		if player.IsSkillRecipeExist(528,i) then
			player.DelSkillRecipe(528,i);
		end
		if player.IsSkillRecipeExist(529,i) then
			player.DelSkillRecipe(529,i);
		end
		if player.IsSkillRecipeExist(530,i) then
			player.DelSkillRecipe(530,i);
		end
		if player.IsSkillRecipeExist(531,i) then
			player.DelSkillRecipe(531,i);
		end
		if player.IsSkillRecipeExist(633,i) then
			player.DelSkillRecipe(633,i);
		end
		if player.IsSkillRecipeExist(634,i) then
			player.DelSkillRecipe(634,i);
		end
		if player.IsSkillRecipeExist(650,i) then
			player.DelSkillRecipe(650,i);
		end
		if player.IsSkillRecipeExist(651,i) then
			player.DelSkillRecipe(651,i);
		end
		if player.IsSkillRecipeExist(962,i) then
			player.DelSkillRecipe(962,i);
		end
		if player.IsSkillRecipeExist(963,i) then
			player.DelSkillRecipe(963,i);
		end
		if player.IsSkillRecipeExist(1175,i) then
			player.DelSkillRecipe(1175,i);
		end
		if player.IsSkillRecipeExist(1176,i) then
			player.DelSkillRecipe(1176,i);
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com