---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս_������/ʷ˼��_ʮ������_�����Ӽ���.lua
-- ����ʱ��:	2014/10/19 19:03:01
-- �����û�:	wangwei-pc2
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

	--local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/npc/����BOSS/̫ԭ֮ս_������/ʷ˼��_ʮ������_�����Ӽ���.lua",
		0														
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

	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.nNeedAccumulateCount = 0;				-- ������Ҫ����ĸ�������skill.bIsAccumulate	= trueʱ��Ч
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 2 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 1;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval = 16; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame = 96;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
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
	skill.nBreakRate = 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	skill.nWeaponDamagePercent = 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target_player = GetPlayer(dwCharacterID)
	if not target_player then	
		player.DelBuff(8408, 1)  --ɾ�����ڴ����ı��
		--print("û��Ŀ��")
		return
	end
	local buff_zishen = player.GetBuff(8408, 1)
	if buff_zishen then
		if buff_zishen.nCustomValue == 1 then
			player.AddBuff(player.dwID, player.nLevel, 8408, 1)    --����������������ڴ�����BUFF
			--print("Ŀ�������������ܾ��ٴ���������")
			return
		end			
	end
	local buff_mubiao = target_player.GetBuff(8408, 1)
	if buff_mubiao then
		if buff_mubiao.nCustomValue == 1 then
			if buff_zishen then
				buff_zishen.nCustomValue = 1
			end
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 9080), 4)
			--print("Ŀ�������������ܾ��ٴ���������2")
			return
		end			
	end
	player.TurnToCharacter(dwCharacterID)
	--[[Ŀ���Ƿ���ϱ�����������  ȡ����������
	local buff_chuangong1 = target_player.GetBuff(8354, 1)
	local buff_chuangong2 = target_player.GetBuff(8410, 1)
	if buff_chuangong1 and buff_chuangong2 then	
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "Ŀ���޷����������ݹ�����", 4)
		--print("Ŀ�������������ܾ��ٴ���������3")
		player.DelBuff(8408, 1)  --ɾ�����ڴ����ı��
		return
	elseif buff_chuangong1 then
		target_player.AddBuff(player.dwID, player.nLevel, 8410, 1)
		--��BUFF1���BUFF2
	elseif buff_chuangong2 then
		--��BUFF2���BUFF1.
		target_player.AddBuff(player.dwID, player.nLevel, 8354, 1)
	else
		--��û�����BUFF1
		--print("Ŀ���ǹ�ģ���ӵ�һ�ֱ�����BUFF")
		target_player.AddBuff(player.dwID, player.nLevel, 8354, 1)
	end
    --]]
	player.AddBuff(player.dwID, player.nLevel, 8408, 1)    --���������ڴ�����BUFF
	
	--1.ÿ�ΰ��Լ����е�8409ת�Ƹ�Ŀ�꣬����ת������10%����Դ��
	--2.����ְҵ��ת��ǰ����,����תѪ,û��ְҵֱ��תѪ,ؤ��ÿ��ת50%��
	local n_ziyuan = 0
	local buff_ziyuan = player.GetBuff(8409, 1)
	if buff_ziyuan then
		n_ziyuan = buff_ziyuan.nStackNum    
	end
	if n_ziyuan > 0 then
		for i = 1, n_ziyuan do                       --һ�߿��Լ���һ�߼Ӷ����
			player.DelBuff(8409, 1)
			target_player.AddBuff(player.dwID, player.nLevel, 8409, 1)
			target_player.nCurrentMana = target_player.nCurrentMana + 3000
		end
	end
	target_player.AddBuff(player.dwID, player.nLevel, 8409, 1) --�ټ�һ������Ϊ������Σ����ζ���һ���������Դ�����ݲ�����1��
	
	if player.dwForceID == 7 or player.dwForceID == 8 or player.dwForceID == 10 or player.dwForceID == 21 then
		--7 ����,8�ؽ�,10����,21����,	ֱ�ӿ�Ѫ
		n_ziyuan = n_ziyuan + 1
		local damage = player.nMaxLife * 0.05								
		if player.nCurrentLife <= damage then
			player.CustomDamage(player.dwID, 13252, 1, 1, damage)
			player.DieByKiller(player.dwID)
		else
			player.CustomDamage(player.dwID, 13252, 1, 1, damage)
		end
		--[[
	elseif player.dwForceID == 9 then
		--9 ؤ�һ�ο�һ����
		if player.nCurrentMana >= player.nMaxMana * 0.5 then
			player.nCurrentMana = player.nCurrentMana - player.nMaxMana * 0.5
		else  --������һ�룬�۹⣬���ҿ�Ѫ
			player.nCurrentMana = 0
			local damage = player.nMaxLife * 0.1		
			if player.nCurrentLife <= damage then
				player.CustomDamage(player.dwID, 13252, 1, 1, damage)
				player.DieByKiller(player.dwID)
			else
				player.CustomDamage(player.dwID, 13252, 1, 1, damage)
			end
		end
		--]]
	else
		--��������ְҵһ�ο�10%����������ʱ�ſ�Ѫ��ÿ��10%
		if player.nCurrentMana >= player.nMaxMana * 0.1 then
			player.nCurrentMana = player.nCurrentMana - player.nMaxMana * 0.1
		else  --������һ�룬�۹⣬���ҿ�Ѫ
			player.nCurrentMana = 0
			local damage = player.nMaxLife * 0.1		
			if player.nCurrentLife <= damage then
				player.CustomDamage(player.dwID, 13252, 1, 1, damage)
				player.DieByKiller(player.dwID)
			else
				player.CustomDamage(player.dwID, 13252, 1, 1, damage)
			end
		end		
	end

--��Ŀ������BOSS���Ƶ����ʱ������Ŀ�����ϵ�8409������������BUFF�����BUFF�ȼ�1~5�������������۳̶ȣ����ļ����Ի���BOSS�����弶�������
--���ݳ�����ͬ��ÿ������������Ҫ�Ĳ���Ҳ��ͬ��
	local scene = player.GetScene()
	local n_lvup = 10
	if scene.dwMapID ~= 192 then
		n_lvup = 25
	end
	local buff_duizhang = target_player.GetBuff(8353, 1)
	if buff_duizhang then
		
		local buff_mubiaoziyuan = target_player.GetBuff(8409, 1)
		if buff_mubiaoziyuan then
		
			local n_Stack = buff_mubiaoziyuan.nStackNum
			if n_Stack >= n_lvup then
				--Ŀ������״̬����������ʱ�������һ��BUFF����ɾ��n_lvup ��8409BUFF�����Ŀ��û��8412BUFF�������һ����
				local n_neilizhuangtai = 0
				for i = 1, 4 do  --
					local buff_neilizhuangtai = target_player.GetBuff(8412, i)
					if buff_neilizhuangtai then
						n_neilizhuangtai = 1   --�����ȡ��״̬buff��ı����
						RemoteCallToClient(target_player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 9065), 4)
						RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 9079), 4)
						target_player.AddBuff(player.dwID, player.nLevel, 8412, i + 1)
						target_player.nCurrentMana = target_player.nCurrentMana + 3000 * n_lvup
						for j = 1, n_Stack do
							target_player.DelBuff(8409, 1)
						end
						if i == 3 then
							local npc_biaoxian = scene.GetNpcByNickName("boss4_duipinbiaoxian")
							if npc_biaoxian then
								npc_biaoxian.DoAction(0, 10069)
							end
						end
						if i == 4 then
							local buff_zishennow = player.GetBuff(8408, 1)
							if buff_zishennow then
								buff_zishennow.nCustomValue = 1
							end
						end
						break
					end					
				end
				if n_neilizhuangtai == 0 then
					--״̬BUFF����Ϊ0�����һ��״̬
					target_player.AddBuff(player.dwID, player.nLevel, 8412, 1)
					RemoteCallToClient(target_player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 9065), 4)
					RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 9079), 4)
					for j = 1, n_Stack do
						target_player.DelBuff(8409, 1)
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